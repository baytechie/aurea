"""
API Wrapper Service - External Data Integration

This module handles fetching ingredient data from external APIs.
Implements caching, error handling, and data normalization.

External APIs:
- Open Food Facts (https://world.openfoodfacts.org/data) - No API key required
- USDA FoodData Central (https://fdc.nal.usda.gov/api-guide.html) - Optional

The wrapper:
1. Queries multiple data sources
2. Normalizes and merges results
3. Handles rate limiting and caching
4. Returns structured ingredient data
"""

import asyncio
import logging
import re
import time
from typing import Optional, Dict, Any, List
from dataclasses import dataclass, field
from datetime import datetime, timedelta
import aiohttp

logger = logging.getLogger(__name__)


@dataclass
class IngredientData:
    """
    Raw ingredient data fetched from external APIs.

    Attributes:
        name: Ingredient name (normalized)
        aliases: Alternative names for the ingredient
        category: Food category (e.g., "sweetener", "additive", "spice")
        nutrients: Nutritional information
        glycemic_index: GI value if available
        additives: E-numbers or additive codes
        allergens: Known allergen information
        source: Which API provided this data
        raw_data: Raw response data for additional processing
    """
    name: str
    aliases: List[str] = field(default_factory=list)
    category: Optional[str] = None
    nutrients: Optional[Dict[str, Any]] = field(default_factory=dict)
    glycemic_index: Optional[float] = None
    additives: Optional[List[str]] = field(default_factory=list)
    allergens: Optional[List[str]] = field(default_factory=list)
    source: Optional[str] = None
    raw_data: Optional[Dict[str, Any]] = None

    def __post_init__(self):
        """Ensure default values for mutable fields."""
        if self.aliases is None:
            self.aliases = []
        if self.nutrients is None:
            self.nutrients = {}
        if self.additives is None:
            self.additives = []
        if self.allergens is None:
            self.allergens = []


class CacheEntry:
    """Simple cache entry with TTL support."""

    def __init__(self, data: Any, ttl_seconds: int = 86400):
        self.data = data
        self.created_at = datetime.utcnow()
        self.ttl = timedelta(seconds=ttl_seconds)

    def is_expired(self) -> bool:
        """Check if cache entry has expired."""
        return datetime.utcnow() > (self.created_at + self.ttl)


class InMemoryCache:
    """
    Simple in-memory cache with TTL support.
    For production, this should be replaced with Redis.
    """

    def __init__(self, default_ttl: int = 86400, max_size: int = 1000):
        self._cache: Dict[str, CacheEntry] = {}
        self.default_ttl = default_ttl
        self.max_size = max_size

    def get(self, key: str) -> Optional[Any]:
        """Get value from cache if not expired."""
        entry = self._cache.get(key)
        if entry is None:
            return None
        if entry.is_expired():
            del self._cache[key]
            return None
        return entry.data

    def set(self, key: str, value: Any, ttl: Optional[int] = None) -> None:
        """Set value in cache with optional custom TTL."""
        # Evict oldest entries if at capacity
        if len(self._cache) >= self.max_size:
            self._evict_oldest()

        self._cache[key] = CacheEntry(value, ttl or self.default_ttl)

    def _evict_oldest(self) -> None:
        """Remove oldest 10% of entries."""
        if not self._cache:
            return

        entries = sorted(
            self._cache.items(),
            key=lambda x: x[1].created_at
        )

        to_remove = max(1, len(entries) // 10)
        for key, _ in entries[:to_remove]:
            del self._cache[key]

    def clear(self) -> None:
        """Clear all cache entries."""
        self._cache.clear()


class RateLimiter:
    """Simple token bucket rate limiter."""

    def __init__(self, rate: int = 100, window: int = 60):
        """
        Initialize rate limiter.

        Args:
            rate: Maximum requests per window
            window: Time window in seconds
        """
        self.rate = rate
        self.window = window
        self.tokens: List[float] = []

    async def acquire(self) -> bool:
        """
        Try to acquire a token. Returns True if allowed.
        Cleans up old tokens and checks rate limit.
        """
        now = time.time()
        window_start = now - self.window

        # Remove tokens outside the window
        self.tokens = [t for t in self.tokens if t > window_start]

        if len(self.tokens) >= self.rate:
            return False

        self.tokens.append(now)
        return True

    async def wait_and_acquire(self, timeout: float = 30.0) -> bool:
        """Wait until a token is available or timeout."""
        deadline = time.time() + timeout

        while time.time() < deadline:
            if await self.acquire():
                return True
            await asyncio.sleep(0.1)

        return False


class CircuitBreaker:
    """
    Circuit breaker pattern to prevent cascading failures.

    States:
        CLOSED: Normal operation, requests pass through
        OPEN: API is down, fail fast without calling
        HALF_OPEN: Testing if API recovered
    """

    def __init__(
        self,
        failure_threshold: int = 5,
        recovery_timeout: int = 30,
        success_threshold: int = 2
    ):
        self.failure_threshold = failure_threshold
        self.recovery_timeout = recovery_timeout
        self.success_threshold = success_threshold

        self.state = "CLOSED"
        self.failure_count = 0
        self.success_count = 0
        self.last_failure_time: Optional[float] = None

    def can_execute(self) -> bool:
        """Check if we can execute a request."""
        if self.state == "CLOSED":
            return True

        if self.state == "OPEN":
            if self.last_failure_time and \
               time.time() - self.last_failure_time > self.recovery_timeout:
                self.state = "HALF_OPEN"
                return True
            return False

        # HALF_OPEN - allow limited requests to test recovery
        return True

    def record_success(self) -> None:
        """Record a successful request."""
        if self.state == "HALF_OPEN":
            self.success_count += 1
            if self.success_count >= self.success_threshold:
                self.state = "CLOSED"
                self.failure_count = 0
                self.success_count = 0
                logger.info("Circuit breaker reset to CLOSED")

    def record_failure(self) -> None:
        """Record a failed request."""
        self.failure_count += 1
        self.last_failure_time = time.time()

        if self.failure_count >= self.failure_threshold:
            self.state = "OPEN"
            logger.warning(f"Circuit breaker opened after {self.failure_count} failures")


class IngredientDataFetcher:
    """
    Fetches and merges ingredient data from multiple external APIs.

    Example usage:
        fetcher = IngredientDataFetcher()
        data = await fetcher.fetch("sugar")
        # Returns IngredientData with merged information

    Features:
        - In-memory caching with configurable TTL
        - Rate limiting to respect API quotas
        - Circuit breaker for resilience
        - Data normalization and merging
    """

    # Open Food Facts API endpoint
    OFF_SEARCH_URL = "https://world.openfoodfacts.org/cgi/search.pl"
    OFF_PRODUCT_URL = "https://world.openfoodfacts.org/api/v2/product"

    # Known ingredient categories for better classification
    KNOWN_CATEGORIES = {
        "sweeteners": ["sugar", "honey", "maple syrup", "agave", "stevia", "aspartame", "sucralose"],
        "dairy": ["milk", "cheese", "butter", "cream", "yogurt", "whey", "casein"],
        "grains": ["wheat", "rice", "oats", "barley", "corn", "quinoa", "rye"],
        "proteins": ["chicken", "beef", "pork", "fish", "tofu", "tempeh", "eggs"],
        "vegetables": ["broccoli", "spinach", "kale", "carrot", "tomato", "pepper", "onion"],
        "fruits": ["apple", "banana", "orange", "berry", "grape", "mango", "avocado"],
        "fats": ["olive oil", "coconut oil", "butter", "lard", "vegetable oil"],
        "additives": ["msg", "carrageenan", "xanthan gum", "sodium nitrate"],
        "spices": ["salt", "pepper", "turmeric", "cinnamon", "ginger", "garlic"],
    }

    # Known glycemic index values for common ingredients
    KNOWN_GI_VALUES = {
        "sugar": 65,
        "white sugar": 65,
        "brown sugar": 64,
        "honey": 58,
        "maple syrup": 54,
        "agave": 15,
        "stevia": 0,
        "white rice": 73,
        "brown rice": 50,
        "white bread": 75,
        "whole wheat bread": 51,
        "oatmeal": 55,
        "potato": 78,
        "sweet potato": 63,
        "apple": 36,
        "banana": 51,
        "orange": 43,
        "watermelon": 76,
        "milk": 31,
        "yogurt": 36,
        "ice cream": 51,
        "chocolate": 40,
        "white pasta": 49,
        "whole wheat pasta": 42,
        "lentils": 32,
        "chickpeas": 28,
        "black beans": 30,
        "carrots": 39,
        "corn": 52,
        "peas": 48,
    }

    def __init__(self, cache_ttl: int = 86400):
        """
        Initialize the fetcher with API clients and caching.

        Args:
            cache_ttl: Cache time-to-live in seconds (default 24 hours)
        """
        self.cache = InMemoryCache(default_ttl=cache_ttl)
        self.rate_limiter = RateLimiter(rate=100, window=60)
        self.circuit_breaker = CircuitBreaker()
        self._session: Optional[aiohttp.ClientSession] = None

    async def _get_session(self) -> aiohttp.ClientSession:
        """Get or create an aiohttp session."""
        if self._session is None or self._session.closed:
            timeout = aiohttp.ClientTimeout(total=10)
            self._session = aiohttp.ClientSession(timeout=timeout)
        return self._session

    async def close(self) -> None:
        """Close the HTTP session."""
        if self._session and not self._session.closed:
            await self._session.close()

    def _normalize_name(self, name: str) -> str:
        """
        Normalize ingredient name for consistent lookups.

        - Convert to lowercase
        - Remove special characters
        - Strip whitespace
        - Handle common variations
        """
        # Lowercase and strip
        normalized = name.lower().strip()

        # Remove special characters except spaces and hyphens
        normalized = re.sub(r'[^a-z0-9\s\-]', '', normalized)

        # Collapse multiple spaces
        normalized = re.sub(r'\s+', ' ', normalized)

        # Common normalizations
        normalizations = {
            "white sugar": "sugar",
            "granulated sugar": "sugar",
            "cane sugar": "sugar",
            "whole milk": "milk",
            "2 percent milk": "milk",
            "skim milk": "milk",
            "extra virgin olive oil": "olive oil",
            "evoo": "olive oil",
        }

        return normalizations.get(normalized, normalized)

    def _determine_category(self, name: str, data: Optional[Dict] = None) -> str:
        """Determine the category for an ingredient."""
        normalized = self._normalize_name(name)

        # Check known categories
        for category, ingredients in self.KNOWN_CATEGORIES.items():
            for ingredient in ingredients:
                if ingredient in normalized or normalized in ingredient:
                    return category

        # Try to extract from API data
        if data:
            categories = data.get("categories_tags", [])
            if categories:
                # Extract meaningful category from tags
                for cat in categories:
                    cat_clean = cat.replace("en:", "").replace("-", " ")
                    if "sugar" in cat_clean or "sweetener" in cat_clean:
                        return "sweeteners"
                    if "dairy" in cat_clean or "milk" in cat_clean:
                        return "dairy"
                    if "meat" in cat_clean or "protein" in cat_clean:
                        return "proteins"
                    if "vegetable" in cat_clean:
                        return "vegetables"
                    if "fruit" in cat_clean:
                        return "fruits"
                    if "grain" in cat_clean or "cereal" in cat_clean:
                        return "grains"

        return "general"

    async def fetch(self, ingredient_name: str) -> Optional[IngredientData]:
        """
        Fetch ingredient data from all available sources.

        Args:
            ingredient_name: Name of the ingredient to look up

        Returns:
            IngredientData with merged information, or None if not found
        """
        normalized_name = self._normalize_name(ingredient_name)

        # Check cache first
        cache_key = f"ingredient:{normalized_name}"
        cached = self.cache.get(cache_key)
        if cached is not None:
            logger.debug(f"Cache hit for ingredient: {normalized_name}")
            return cached

        logger.info(f"Fetching ingredient data for: {normalized_name}")

        # Fetch from Open Food Facts
        off_data = await self.fetch_from_openfoodfacts(normalized_name)

        # Merge and normalize results
        result = self.merge_results(off_data, None)
        result.name = normalized_name

        # Cache the result
        self.cache.set(cache_key, result)

        return result

    async def fetch_batch(self, names: List[str]) -> Dict[str, IngredientData]:
        """
        Batch fetch for efficiency.

        Args:
            names: List of ingredient names to fetch

        Returns:
            Dictionary mapping ingredient names to their data
        """
        results = {}
        tasks = []

        for name in names:
            tasks.append(self.fetch(name))

        fetched = await asyncio.gather(*tasks, return_exceptions=True)

        for name, data in zip(names, fetched):
            if isinstance(data, Exception):
                logger.error(f"Error fetching {name}: {data}")
                results[name] = IngredientData(
                    name=self._normalize_name(name),
                    source="error"
                )
            elif data:
                results[name] = data
            else:
                results[name] = IngredientData(
                    name=self._normalize_name(name),
                    source="not_found"
                )

        return results

    async def search(self, query: str, limit: int = 10) -> List[IngredientData]:
        """
        Search for ingredients matching query.

        Args:
            query: Search query string
            limit: Maximum number of results to return

        Returns:
            List of matching IngredientData objects
        """
        if not self.circuit_breaker.can_execute():
            logger.warning("Circuit breaker open, returning empty search results")
            return []

        if not await self.rate_limiter.acquire():
            logger.warning("Rate limit exceeded for search")
            return []

        try:
            session = await self._get_session()

            params = {
                "search_terms": query,
                "search_simple": 1,
                "action": "process",
                "json": 1,
                "page_size": limit,
                "fields": "product_name,categories_tags,nutriments,allergens_tags,additives_tags"
            }

            async with session.get(self.OFF_SEARCH_URL, params=params) as response:
                if response.status == 200:
                    data = await response.json()
                    self.circuit_breaker.record_success()

                    products = data.get("products", [])
                    results = []

                    for product in products[:limit]:
                        name = product.get("product_name", query)
                        if name:
                            ingredient_data = self._parse_off_product(product)
                            ingredient_data.name = self._normalize_name(name)
                            results.append(ingredient_data)

                    return results
                else:
                    self.circuit_breaker.record_failure()
                    logger.error(f"Open Food Facts search failed: {response.status}")
                    return []

        except Exception as e:
            self.circuit_breaker.record_failure()
            logger.error(f"Error searching Open Food Facts: {e}")
            return []

    async def fetch_from_openfoodfacts(self, name: str) -> Optional[Dict[str, Any]]:
        """
        Fetch ingredient data from Open Food Facts API.

        Args:
            name: Ingredient name to search

        Returns:
            Raw API response data or None
        """
        if not self.circuit_breaker.can_execute():
            logger.warning("Circuit breaker open, skipping Open Food Facts API")
            return None

        if not await self.rate_limiter.acquire():
            logger.warning("Rate limit exceeded for Open Food Facts")
            return None

        try:
            session = await self._get_session()

            # Search for products containing this ingredient
            params = {
                "search_terms": name,
                "search_simple": 1,
                "action": "process",
                "json": 1,
                "page_size": 5,
                "fields": "product_name,categories_tags,nutriments,allergens_tags,additives_tags,ingredients_tags,nutrition_grades"
            }

            async with session.get(self.OFF_SEARCH_URL, params=params) as response:
                if response.status == 200:
                    data = await response.json()
                    self.circuit_breaker.record_success()

                    products = data.get("products", [])
                    if products:
                        # Return the most relevant product
                        return products[0]
                    return None
                else:
                    self.circuit_breaker.record_failure()
                    logger.error(f"Open Food Facts API returned {response.status}")
                    return None

        except asyncio.TimeoutError:
            self.circuit_breaker.record_failure()
            logger.error("Open Food Facts API timeout")
            return None
        except Exception as e:
            self.circuit_breaker.record_failure()
            logger.error(f"Error fetching from Open Food Facts: {e}")
            return None

    async def fetch_from_usda(self, name: str) -> Optional[Dict[str, Any]]:
        """
        Fetch ingredient data from USDA FoodData Central API.

        Note: USDA API requires an API key. For MVP, we rely primarily on
        Open Food Facts and internal data.

        Args:
            name: Ingredient name to search

        Returns:
            Raw API response data or None
        """
        # USDA API requires an API key - skip for MVP
        # This can be implemented later with proper API key management
        logger.debug(f"USDA API not configured, skipping for: {name}")
        return None

    def _parse_off_product(self, product: Dict[str, Any]) -> IngredientData:
        """Parse Open Food Facts product data into IngredientData."""
        nutriments = product.get("nutriments", {})

        # Extract nutrients
        nutrients = {
            "calories": nutriments.get("energy-kcal_100g"),
            "fat": nutriments.get("fat_100g"),
            "saturated_fat": nutriments.get("saturated-fat_100g"),
            "carbohydrates": nutriments.get("carbohydrates_100g"),
            "sugars": nutriments.get("sugars_100g"),
            "fiber": nutriments.get("fiber_100g"),
            "protein": nutriments.get("proteins_100g"),
            "sodium": nutriments.get("sodium_100g"),
            "salt": nutriments.get("salt_100g"),
        }

        # Remove None values
        nutrients = {k: v for k, v in nutrients.items() if v is not None}

        # Extract allergens
        allergens_tags = product.get("allergens_tags", [])
        allergens = [tag.replace("en:", "") for tag in allergens_tags]

        # Extract additives
        additives_tags = product.get("additives_tags", [])
        additives = [tag.replace("en:", "") for tag in additives_tags]

        return IngredientData(
            name=product.get("product_name", ""),
            category=self._determine_category(product.get("product_name", ""), product),
            nutrients=nutrients,
            allergens=allergens,
            additives=additives,
            source="openfoodfacts",
            raw_data=product
        )

    def merge_results(
        self,
        openfoodfacts_data: Optional[Dict],
        usda_data: Optional[Dict]
    ) -> IngredientData:
        """
        Merge data from multiple sources into a single IngredientData object.

        Args:
            openfoodfacts_data: Data from Open Food Facts
            usda_data: Data from USDA

        Returns:
            Merged IngredientData
        """
        # Start with Open Food Facts data if available
        if openfoodfacts_data:
            result = self._parse_off_product(openfoodfacts_data)
        else:
            result = IngredientData(name="unknown", source="internal")

        # If we have USDA data, prefer it for nutritional info
        if usda_data:
            # USDA data would be merged here when implemented
            pass

        # Look up known GI value
        normalized_name = self._normalize_name(result.name)
        if normalized_name in self.KNOWN_GI_VALUES:
            result.glycemic_index = self.KNOWN_GI_VALUES[normalized_name]

        # Ensure source is set
        if not result.source:
            result.source = "merged" if openfoodfacts_data or usda_data else "internal"

        return result

    def get_fallback_data(self, ingredient_name: str) -> IngredientData:
        """
        Get fallback data for ingredients not found in external APIs.
        Uses internal knowledge base.

        Args:
            ingredient_name: Name of the ingredient

        Returns:
            IngredientData with basic information
        """
        normalized = self._normalize_name(ingredient_name)
        category = self._determine_category(normalized)

        # Get GI if known
        gi = self.KNOWN_GI_VALUES.get(normalized)

        return IngredientData(
            name=normalized,
            category=category,
            glycemic_index=gi,
            source="internal",
            nutrients={},
            allergens=[],
            additives=[]
        )
