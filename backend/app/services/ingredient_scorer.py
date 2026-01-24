"""
Ingredient Scoring Service - Health Impact Analysis

This module calculates health impact scores for ingredients based on
nutritional data and known health effects.

Scoring dimensions:
1. Blood Sugar Impact (0-100): Higher = better (less blood sugar spike)
2. Inflammation Potential (0-100): Higher = worse (more inflammatory)
3. Gut Impact (0-100): Higher = better (more gut-friendly)
4. Hormonal Relevance (0-100): Impact on hormonal balance

The scoring algorithm considers:
- Glycemic index/load
- Fiber content
- Omega-6/Omega-3 ratio
- Processed vs whole food
- Known inflammatory markers
- Prebiotic/probiotic content
"""

import logging
from typing import Optional, Dict, Any, List
from dataclasses import dataclass

from .api_wrapper import IngredientData, IngredientDataFetcher

logger = logging.getLogger(__name__)


@dataclass
class IngredientScores:
    """
    Health impact scores for an ingredient.

    All scores are 0-100 where:
    - Blood sugar: Higher = better (less spike)
    - Inflammation: Higher = worse (more inflammatory)
    - Gut impact: Higher = better (more beneficial)
    - Hormonal: Higher = more relevant/impactful
    - Overall: Higher = better overall health impact
    """
    name: str
    blood_sugar_impact: int
    inflammation_potential: int
    gut_impact: int
    hormonal_relevance: Dict[str, Any]
    overall_score: int
    evidence_confidence: str  # "high", "medium", "low"
    sources: List[Dict[str, str]]


class IngredientScorer:
    """
    Calculates health impact scores for ingredients using rule-based algorithms.

    Example usage:
        scorer = IngredientScorer()
        scores = await scorer.score_ingredient("sugar")
        print(scores.blood_sugar_impact)  # e.g., 20 (bad for blood sugar)
        print(scores.inflammation_potential)  # e.g., 70 (quite inflammatory)

    The scorer uses:
        1. Raw ingredient data from IngredientDataFetcher
        2. Rule-based scoring for each health dimension
        3. Weighted overall score calculation
        4. Evidence confidence determination
    """

    # Weights for overall score calculation
    WEIGHTS = {
        "blood_sugar": 0.30,
        "inflammation": 0.30,
        "gut": 0.25,
        "hormonal": 0.15
    }

    # Known high-inflammation ingredients
    HIGH_INFLAMMATION_INGREDIENTS = {
        "sugar", "refined sugar", "high fructose corn syrup", "corn syrup",
        "vegetable oil", "soybean oil", "corn oil", "margarine",
        "processed meat", "hot dog", "sausage", "bacon",
        "white bread", "white flour", "refined flour",
        "trans fat", "partially hydrogenated",
        "msg", "monosodium glutamate",
    }

    # Known anti-inflammatory ingredients
    ANTI_INFLAMMATORY_INGREDIENTS = {
        "turmeric", "ginger", "garlic", "olive oil", "extra virgin olive oil",
        "salmon", "mackerel", "sardines", "tuna",  # Fatty fish
        "walnuts", "almonds", "flaxseed", "chia seeds",
        "blueberries", "strawberries", "cherries",
        "spinach", "kale", "broccoli",
        "green tea", "dark chocolate",
    }

    # Known gut-friendly ingredients
    GUT_FRIENDLY_INGREDIENTS = {
        "yogurt", "kefir", "sauerkraut", "kimchi", "kombucha", "miso",
        "tempeh", "natto",  # Fermented
        "banana", "onion", "garlic", "leek", "asparagus",  # Prebiotic
        "oats", "barley", "flaxseed",  # Fiber-rich
        "artichoke", "chicory", "dandelion greens",
    }

    # Known gut-harmful ingredients
    GUT_HARMFUL_INGREDIENTS = {
        "aspartame", "sucralose", "saccharin", "acesulfame",  # Artificial sweeteners
        "carrageenan", "polysorbate 80", "carboxymethylcellulose",  # Emulsifiers
        "artificial colors", "red 40", "yellow 5", "blue 1",
        "sodium nitrate", "sodium nitrite",
        "high fructose corn syrup",
    }

    # Ingredients affecting hormones
    HORMONAL_IMPACT_INGREDIENTS = {
        "soy": {"estrogen_impact": "moderate", "details": "Contains phytoestrogens"},
        "flaxseed": {"estrogen_impact": "low", "details": "Contains lignans"},
        "dairy": {"estrogen_impact": "low", "insulin_impact": "moderate", "details": "May contain hormones"},
        "sugar": {"insulin_impact": "high", "details": "Spikes insulin levels"},
        "coffee": {"cortisol_impact": "moderate", "details": "Can increase cortisol"},
        "caffeine": {"cortisol_impact": "moderate", "details": "Stimulates cortisol release"},
        "alcohol": {"estrogen_impact": "moderate", "cortisol_impact": "moderate", "details": "Affects multiple hormones"},
        "cruciferous": {"estrogen_impact": "beneficial", "details": "Supports estrogen metabolism"},
        "broccoli": {"estrogen_impact": "beneficial", "details": "Contains DIM for estrogen balance"},
    }

    # Known glycemic index values
    GLYCEMIC_INDEX_VALUES = {
        "sugar": 65, "glucose": 100, "honey": 58, "maple syrup": 54,
        "agave": 15, "stevia": 0, "white rice": 73, "brown rice": 50,
        "white bread": 75, "whole wheat bread": 51, "oatmeal": 55,
        "potato": 78, "sweet potato": 63, "apple": 36, "banana": 51,
        "orange": 43, "watermelon": 76, "milk": 31, "yogurt": 36,
        "ice cream": 51, "chocolate": 40, "white pasta": 49,
        "whole wheat pasta": 42, "lentils": 32, "chickpeas": 28,
        "black beans": 30, "carrots": 39, "corn": 52, "peas": 48,
        "quinoa": 53, "barley": 28, "bulgur": 48,
    }

    def __init__(self):
        """Initialize the scorer with data fetcher."""
        self.fetcher = IngredientDataFetcher()

    async def score_ingredient(self, ingredient_name: str) -> Optional[IngredientScores]:
        """
        Calculate all health impact scores for an ingredient.

        Args:
            ingredient_name: Name of the ingredient to score

        Returns:
            IngredientScores object with all scores, or None if not found
        """
        try:
            # Fetch ingredient data
            data = await self.fetcher.fetch(ingredient_name)

            if data is None:
                # Use fallback data
                data = self.fetcher.get_fallback_data(ingredient_name)

            # Calculate individual scores
            blood_sugar = self._compute_blood_sugar_score(data)
            inflammation = self._compute_inflammation_score(data)
            gut = self._compute_gut_score(data)
            hormonal = self._compute_hormonal_score(data)

            # Calculate overall score
            overall = self._calculate_overall_score(
                blood_sugar, inflammation, gut, hormonal
            )

            # Determine confidence
            confidence = self._determine_confidence(data)

            # Build sources list
            sources = self._build_sources(data)

            return IngredientScores(
                name=data.name,
                blood_sugar_impact=blood_sugar,
                inflammation_potential=inflammation,
                gut_impact=gut,
                hormonal_relevance=hormonal,
                overall_score=overall,
                evidence_confidence=confidence,
                sources=sources
            )

        except Exception as e:
            logger.error(f"Error scoring ingredient {ingredient_name}: {e}")
            # Return default scores on error
            return IngredientScores(
                name=ingredient_name.lower(),
                blood_sugar_impact=50,
                inflammation_potential=50,
                gut_impact=50,
                hormonal_relevance={"score": 50, "details": "Unable to analyze"},
                overall_score=50,
                evidence_confidence="low",
                sources=[{"name": "Error", "details": str(e)}]
            )

    def _compute_blood_sugar_score(self, data: IngredientData) -> int:
        """
        Calculate blood sugar impact score.

        Higher score = better (less blood sugar spike)

        Factors:
        - Glycemic index
        - Fiber content
        - Sugar content
        - Processing level
        """
        score = 50  # Base score

        # Glycemic index adjustment
        gi = data.glycemic_index
        if gi is None:
            # Try to look up known values
            gi = self.GLYCEMIC_INDEX_VALUES.get(data.name.lower())

        if gi is not None:
            if gi < 35:
                score += 40  # Low GI - excellent
            elif gi < 55:
                score += 20  # Medium GI - good
            elif gi < 70:
                score -= 10  # Medium-high GI
            else:
                score -= 30  # High GI - bad

        # Fiber adjustment (from nutrients)
        nutrients = data.nutrients or {}
        fiber = nutrients.get("fiber", 0) or 0

        if fiber > 10:
            score += 15  # Very high fiber
        elif fiber > 5:
            score += 10  # High fiber
        elif fiber > 2:
            score += 5   # Moderate fiber

        # Sugar content penalty
        sugars = nutrients.get("sugars", 0) or 0
        if sugars > 20:
            score -= 30  # Very high sugar
        elif sugars > 10:
            score -= 20  # High sugar
        elif sugars > 5:
            score -= 10  # Moderate sugar

        # Category-based adjustments
        category = data.category or ""
        if category == "sweeteners":
            score -= 15
        elif category == "vegetables":
            score += 10
        elif category in ("fruits", "grains"):
            # Neutral - depends on specific item

            pass

        # Clamp to valid range
        return max(0, min(100, score))

    def _compute_inflammation_score(self, data: IngredientData) -> int:
        """
        Calculate inflammation potential score.

        Higher score = worse (more inflammatory)

        Factors:
        - Known inflammatory compounds
        - Omega-6/Omega-3 ratio
        - Trans fat and saturated fat
        - Antioxidants
        - Processing level
        """
        score = 30  # Base score (slightly anti-inflammatory baseline)

        name_lower = data.name.lower()
        nutrients = data.nutrients or {}

        # Check known inflammatory ingredients
        for inflammatory in self.HIGH_INFLAMMATION_INGREDIENTS:
            if inflammatory in name_lower:
                score += 35
                break

        # Check anti-inflammatory ingredients
        for anti_inflammatory in self.ANTI_INFLAMMATORY_INGREDIENTS:
            if anti_inflammatory in name_lower:
                score -= 25
                break

        # Saturated fat adjustment
        sat_fat = nutrients.get("saturated_fat", 0) or 0
        if sat_fat > 10:
            score += 20
        elif sat_fat > 5:
            score += 10

        # Trans fat is highly inflammatory (if data available)
        # Note: Often not available in basic nutrient data
        if "trans" in name_lower or "hydrogenated" in name_lower:
            score += 30

        # Sugar is inflammatory
        sugars = nutrients.get("sugars", 0) or 0
        if sugars > 20:
            score += 20
        elif sugars > 10:
            score += 10

        # Additives can be inflammatory
        additives = data.additives or []
        if additives:
            score += min(15, len(additives) * 3)

        # Category-based adjustments
        category = data.category or ""
        if category == "vegetables":
            score -= 15
        elif category == "fruits":
            score -= 10
        elif category == "additives":
            score += 20

        # Clamp to valid range
        return max(0, min(100, score))

    def _compute_gut_score(self, data: IngredientData) -> int:
        """
        Calculate gut health impact score.

        Higher score = better (more gut-friendly)

        Factors:
        - Fiber content (prebiotic)
        - Fermented status
        - Artificial sweeteners
        - Emulsifiers and additives
        - Polyphenol content
        """
        score = 50  # Base score

        name_lower = data.name.lower()
        nutrients = data.nutrients or {}
        additives = data.additives or []

        # Check gut-friendly ingredients
        for friendly in self.GUT_FRIENDLY_INGREDIENTS:
            if friendly in name_lower:
                score += 25
                break

        # Check gut-harmful ingredients
        for harmful in self.GUT_HARMFUL_INGREDIENTS:
            if harmful in name_lower:
                score -= 25
                break

        # Fiber is great for gut health
        fiber = nutrients.get("fiber", 0) or 0
        if fiber > 7:
            score += 25  # Very high fiber
        elif fiber > 3:
            score += 15  # Good fiber
        elif fiber > 1:
            score += 5   # Some fiber

        # Fermented foods bonus
        fermented_keywords = ["fermented", "yogurt", "kefir", "sauerkraut",
                            "kimchi", "kombucha", "miso", "tempeh"]
        if any(kw in name_lower for kw in fermented_keywords):
            score += 20

        # Artificial sweetener penalty
        artificial_sweeteners = ["aspartame", "sucralose", "saccharin",
                                "acesulfame", "neotame"]
        if any(sw in name_lower for sw in artificial_sweeteners):
            score -= 20

        # Check additives for harmful compounds
        harmful_additive_keywords = ["carrageenan", "polysorbate", "emulsifier",
                                    "artificial", "color", "e4"]
        for additive in additives:
            additive_lower = additive.lower()
            if any(kw in additive_lower for kw in harmful_additive_keywords):
                score -= 10
                break

        # Category adjustments
        category = data.category or ""
        if category == "vegetables":
            score += 10
        elif category == "additives":
            score -= 15

        # Clamp to valid range
        return max(0, min(100, score))

    def _compute_hormonal_score(self, data: IngredientData) -> Dict[str, Any]:
        """
        Calculate hormonal relevance score and breakdown.

        Returns detailed breakdown of hormonal impacts:
        - Overall score (0-100, higher = more impactful)
        - Insulin impact
        - Estrogen impact
        - Cortisol impact
        - Human-readable details
        """
        name_lower = data.name.lower()
        nutrients = data.nutrients or {}

        result = {
            "score": 30,  # Base score (low impact)
            "insulin_impact": "low",
            "estrogen_impact": "low",
            "cortisol_impact": "low",
            "details": "Minimal hormonal impact expected"
        }

        details_parts = []

        # Check known hormonal impact ingredients
        for ingredient, impacts in self.HORMONAL_IMPACT_INGREDIENTS.items():
            if ingredient in name_lower:
                if "insulin_impact" in impacts:
                    result["insulin_impact"] = impacts["insulin_impact"]
                    if impacts["insulin_impact"] == "high":
                        result["score"] += 30
                    elif impacts["insulin_impact"] == "moderate":
                        result["score"] += 15

                if "estrogen_impact" in impacts:
                    result["estrogen_impact"] = impacts["estrogen_impact"]
                    if impacts["estrogen_impact"] in ("moderate", "high"):
                        result["score"] += 20
                    elif impacts["estrogen_impact"] == "beneficial":
                        result["score"] -= 10

                if "cortisol_impact" in impacts:
                    result["cortisol_impact"] = impacts["cortisol_impact"]
                    if impacts["cortisol_impact"] == "moderate":
                        result["score"] += 15
                    elif impacts["cortisol_impact"] == "high":
                        result["score"] += 25

                details_parts.append(impacts.get("details", ""))

        # High GI foods affect insulin
        gi = data.glycemic_index or self.GLYCEMIC_INDEX_VALUES.get(name_lower)
        if gi is not None:
            if gi > 70:
                result["insulin_impact"] = "high"
                result["score"] += 25
                details_parts.append("High glycemic index spikes insulin")
            elif gi > 55:
                if result["insulin_impact"] == "low":
                    result["insulin_impact"] = "moderate"
                result["score"] += 10

        # High sugar affects insulin
        sugars = nutrients.get("sugars", 0) or 0
        if sugars > 15:
            if result["insulin_impact"] != "high":
                result["insulin_impact"] = "moderate" if result["insulin_impact"] == "low" else "high"
            result["score"] += 15
            if "insulin" not in " ".join(details_parts).lower():
                details_parts.append("Sugar content affects insulin")

        # Build details string
        if details_parts:
            result["details"] = ". ".join(filter(None, details_parts))
        else:
            result["details"] = "No significant hormonal impact identified"

        # Clamp score
        result["score"] = max(0, min(100, result["score"]))

        return result

    def _calculate_overall_score(
        self,
        blood_sugar: int,
        inflammation: int,
        gut: int,
        hormonal: Dict
    ) -> int:
        """
        Calculate weighted overall health score.

        Higher overall score = better for health

        Note: Inflammation is inverted since higher inflammation is bad.
        Hormonal score is also inverted since lower impact is generally better.
        """
        inverted_inflammation = 100 - inflammation
        hormonal_score = hormonal.get("score", 50)
        inverted_hormonal = 100 - hormonal_score

        overall = (
            blood_sugar * self.WEIGHTS["blood_sugar"] +
            inverted_inflammation * self.WEIGHTS["inflammation"] +
            gut * self.WEIGHTS["gut"] +
            inverted_hormonal * self.WEIGHTS["hormonal"]
        )

        return int(max(0, min(100, overall)))

    def _determine_confidence(self, data: IngredientData) -> str:
        """
        Determine evidence confidence level.

        Returns:
            "high" - Multiple reliable sources, well-studied ingredient
            "medium" - Some data available, moderately studied
            "low" - Limited data, poorly studied or estimated
        """
        confidence_score = 0

        # Source quality
        source = data.source or ""
        if source in ("usda", "openfoodfacts"):
            confidence_score += 2
        elif source == "merged":
            confidence_score += 3  # Multiple sources
        elif source == "internal":
            confidence_score += 1

        # Nutrient data completeness
        nutrients = data.nutrients or {}
        if len(nutrients) >= 5:
            confidence_score += 2
        elif len(nutrients) >= 3:
            confidence_score += 1

        # GI data available
        if data.glycemic_index is not None:
            confidence_score += 1

        # Category is known
        if data.category and data.category != "general":
            confidence_score += 1

        # Determine confidence level
        if confidence_score >= 5:
            return "high"
        elif confidence_score >= 3:
            return "medium"
        else:
            return "low"

    def _build_sources(self, data: IngredientData) -> List[Dict[str, str]]:
        """Build sources list from ingredient data."""
        sources = []

        source = data.source or "unknown"

        if source == "openfoodfacts" or source == "merged":
            sources.append({
                "name": "Open Food Facts",
                "url": "https://world.openfoodfacts.org/"
            })

        if source == "usda" or source == "merged":
            sources.append({
                "name": "USDA FoodData Central",
                "url": "https://fdc.nal.usda.gov/"
            })

        if source == "internal":
            sources.append({
                "name": "Internal Database",
                "details": "Based on nutritional research"
            })

        # Always add general reference
        sources.append({
            "name": "Glycemic Index Foundation",
            "url": "https://www.glycemicindex.com/"
        })

        return sources

    async def score_ingredients_batch(
        self,
        ingredient_names: List[str]
    ) -> Dict[str, IngredientScores]:
        """
        Score multiple ingredients efficiently.

        Args:
            ingredient_names: List of ingredient names to score

        Returns:
            Dictionary mapping ingredient names to their scores
        """
        results = {}

        for name in ingredient_names:
            scores = await self.score_ingredient(name)
            if scores:
                results[name] = scores

        return results

    def get_score_interpretation(self, scores: IngredientScores) -> str:
        """
        Generate a human-readable interpretation of the scores.

        Args:
            scores: IngredientScores to interpret

        Returns:
            Human-readable string describing the health impact
        """
        parts = []

        # Overall assessment
        if scores.overall_score >= 70:
            parts.append(f"{scores.name.title()} is generally a healthy choice.")
        elif scores.overall_score >= 50:
            parts.append(f"{scores.name.title()} has moderate health impact.")
        else:
            parts.append(f"{scores.name.title()} may have some health concerns.")

        # Blood sugar
        if scores.blood_sugar_impact < 40:
            parts.append("It can significantly impact blood sugar levels.")
        elif scores.blood_sugar_impact > 70:
            parts.append("It has minimal effect on blood sugar.")

        # Inflammation
        if scores.inflammation_potential > 60:
            parts.append("It has inflammatory potential.")
        elif scores.inflammation_potential < 30:
            parts.append("It may have anti-inflammatory properties.")

        # Gut health
        if scores.gut_impact > 70:
            parts.append("It's beneficial for gut health.")
        elif scores.gut_impact < 40:
            parts.append("It may negatively affect gut health.")

        # Hormonal
        hormonal = scores.hormonal_relevance
        if hormonal.get("score", 50) > 60:
            parts.append(f"Hormonal note: {hormonal.get('details', 'May affect hormones.')}")

        return " ".join(parts)
