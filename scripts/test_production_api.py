#!/usr/bin/env python3
"""
Production API Test Suite for Aurea

This script tests the live production API to verify deployment.
Run after deployment to ensure all endpoints are working correctly.

Usage:
    python scripts/test_production_api.py
    python scripts/test_production_api.py --verbose
    python scripts/test_production_api.py --base-url https://api.aureahealth.app
"""

import argparse
import json
import subprocess
import sys
from typing import Dict, List, Tuple, Any


# Default production API URL
DEFAULT_BASE_URL = "https://api.aureahealth.app"

# Test results tracking
PASSED = 0
FAILED = 0
ERRORS: List[str] = []


def test(name: str):
    """Decorator for test functions."""
    def decorator(func):
        def wrapper(*args, **kwargs):
            global PASSED, FAILED
            try:
                result, message = func(*args, **kwargs)
                if result:
                    PASSED += 1
                    print(f"  ✅ {name}")
                    return True
                else:
                    FAILED += 1
                    ERRORS.append(f"{name}: {message}")
                    print(f"  ❌ {name}: {message}")
                    return False
            except Exception as e:
                FAILED += 1
                ERRORS.append(f"{name}: Exception - {str(e)}")
                print(f"  ❌ {name}: Exception - {str(e)}")
                return False
        wrapper.__name__ = func.__name__
        return wrapper
    return decorator


def api_get(base_url: str, endpoint: str, verbose: bool = False) -> Tuple[int, Any]:
    """Make GET request to API using curl and return status code and JSON response."""
    url = f"{base_url}{endpoint}"
    if verbose:
        print(f"    GET {url}")

    try:
        # Use curl for more reliable HTTPS handling
        result = subprocess.run(
            ["curl", "-s", "-w", "\n%{http_code}", url],
            capture_output=True,
            text=True,
            timeout=10
        )

        output_lines = result.stdout.strip().split('\n')
        status_code = int(output_lines[-1])
        json_body = '\n'.join(output_lines[:-1])

        if json_body:
            data = json.loads(json_body)
        else:
            data = {}

        return status_code, data
    except subprocess.TimeoutExpired:
        return 0, {"error": "Request timeout"}
    except json.JSONDecodeError as e:
        return 0, {"error": f"JSON decode error: {str(e)}"}
    except Exception as e:
        return 0, {"error": str(e)}


class ProductionAPITests:
    """Test suite for production API verification."""

    def __init__(self, base_url: str, verbose: bool = False):
        self.base_url = base_url
        self.verbose = verbose

    # =========================================================================
    # Health & Basic Tests
    # =========================================================================

    @test("API health check returns OK")
    def test_health_check(self) -> Tuple[bool, str]:
        status, data = api_get(self.base_url, "/health", self.verbose)
        if status != 200:
            return False, f"Status {status}"
        if data.get("status") != "ok":
            return False, f"Status not 'ok': {data.get('status')}"
        return True, ""

    @test("API returns production environment")
    def test_production_environment(self) -> Tuple[bool, str]:
        status, data = api_get(self.base_url, "/health", self.verbose)
        if status != 200:
            return False, f"Status {status}"
        env = data.get("environment", "")
        if env != "production":
            return False, f"Environment is '{env}', expected 'production'"
        return True, ""

    # =========================================================================
    # Categories Endpoint Tests
    # =========================================================================

    @test("Categories endpoint returns 200")
    def test_categories_endpoint(self) -> Tuple[bool, str]:
        status, data = api_get(self.base_url, "/ingredients/categories", self.verbose)
        if status != 200:
            return False, f"Status {status}"
        return True, ""

    @test("Categories includes Sweeteners (15)")
    def test_sweeteners_category(self) -> Tuple[bool, str]:
        status, data = api_get(self.base_url, "/ingredients/categories", self.verbose)
        if status != 200:
            return False, f"Status {status}"

        categories = data.get("categories", [])
        sweeteners = next((c for c in categories if c.get("name") == "Sweeteners"), None)

        if not sweeteners:
            return False, "Sweeteners category not found"
        if sweeteners.get("count") != 15:
            return False, f"Expected 15, got {sweeteners.get('count')}"
        return True, ""

    @test("Categories includes Fats & Oils (15)")
    def test_fats_oils_category(self) -> Tuple[bool, str]:
        status, data = api_get(self.base_url, "/ingredients/categories", self.verbose)
        if status != 200:
            return False, f"Status {status}"

        categories = data.get("categories", [])
        fats_oils = next((c for c in categories if c.get("name") == "Fats & Oils"), None)

        if not fats_oils:
            return False, "Fats & Oils category not found"
        if fats_oils.get("count") != 15:
            return False, f"Expected 15, got {fats_oils.get('count')}"
        return True, ""

    # =========================================================================
    # Ingredient Detail Tests
    # =========================================================================

    @test("Stevia returns correct overall score (79)")
    def test_stevia_overall_score(self) -> Tuple[bool, str]:
        status, data = api_get(self.base_url, "/ingredient/stevia", self.verbose)
        if status != 200:
            return False, f"Status {status}"
        if data.get("overall_score") != 79:
            return False, f"Expected 79, got {data.get('overall_score')}"
        return True, ""

    @test("Stevia has health_scores object")
    def test_stevia_health_scores(self) -> Tuple[bool, str]:
        status, data = api_get(self.base_url, "/ingredient/stevia", self.verbose)
        if status != 200:
            return False, f"Status {status}"
        if "health_scores" not in data or data["health_scores"] is None:
            return False, "health_scores missing or null"
        return True, ""

    @test("Stevia health_scores has all 5 categories")
    def test_stevia_health_categories(self) -> Tuple[bool, str]:
        status, data = api_get(self.base_url, "/ingredient/stevia", self.verbose)
        if status != 200:
            return False, f"Status {status}"

        health_scores = data.get("health_scores", {})
        expected = ["blood_sugar", "inflammation", "gut_impact", "disease_links", "hormonal"]
        missing = [cat for cat in expected if cat not in health_scores]

        if missing:
            return False, f"Missing categories: {missing}"
        return True, ""

    @test("Stevia is marked as trusted")
    def test_stevia_is_trusted(self) -> Tuple[bool, str]:
        status, data = api_get(self.base_url, "/ingredient/stevia", self.verbose)
        if status != 200:
            return False, f"Status {status}"
        if not data.get("is_trusted"):
            return False, "is_trusted is False or missing"
        return True, ""

    @test("Stevia has category 'Sweeteners'")
    def test_stevia_category(self) -> Tuple[bool, str]:
        status, data = api_get(self.base_url, "/ingredient/stevia", self.verbose)
        if status != 200:
            return False, f"Status {status}"
        if data.get("category") != "Sweeteners":
            return False, f"Expected 'Sweeteners', got '{data.get('category')}'"
        return True, ""

    @test("Olive oil returns correct overall score (85)")
    def test_olive_oil_score(self) -> Tuple[bool, str]:
        status, data = api_get(self.base_url, "/ingredient/olive%20oil", self.verbose)
        if status != 200:
            return False, f"Status {status}"
        if data.get("overall_score") != 85:
            return False, f"Expected 85, got {data.get('overall_score')}"
        return True, ""

    @test("Olive oil has category 'Fats & Oils'")
    def test_olive_oil_category(self) -> Tuple[bool, str]:
        status, data = api_get(self.base_url, "/ingredient/olive%20oil", self.verbose)
        if status != 200:
            return False, f"Status {status}"
        if data.get("category") != "Fats & Oils":
            return False, f"Expected 'Fats & Oils', got '{data.get('category')}'"
        return True, ""

    @test("Sugar (white, brown) returns score 22")
    def test_sugar_score(self) -> Tuple[bool, str]:
        status, data = api_get(self.base_url, "/ingredient/sugar%20(white,%20brown)", self.verbose)
        if status != 200:
            return False, f"Status {status}"
        if data.get("overall_score") != 22:
            return False, f"Expected 22, got {data.get('overall_score')}"
        return True, ""

    @test("Stevia has research sources")
    def test_stevia_sources(self) -> Tuple[bool, str]:
        status, data = api_get(self.base_url, "/ingredient/stevia", self.verbose)
        if status != 200:
            return False, f"Status {status}"
        sources = data.get("sources", [])
        if not sources or len(sources) == 0:
            return False, "No sources found"
        if "url" not in sources[0]:
            return False, "Source missing 'url' field"
        return True, ""

    # =========================================================================
    # Ingredients List Tests
    # =========================================================================

    @test("Ingredients list returns paginated response")
    def test_list_pagination(self) -> Tuple[bool, str]:
        status, data = api_get(self.base_url, "/ingredients/list", self.verbose)
        if status != 200:
            return False, f"Status {status}"

        required = ["ingredients", "total", "page", "page_size", "total_pages"]
        missing = [f for f in required if f not in data]
        if missing:
            return False, f"Missing fields: {missing}"
        return True, ""

    @test("Ingredients list has at least 30 total")
    def test_list_total(self) -> Tuple[bool, str]:
        status, data = api_get(self.base_url, "/ingredients/list", self.verbose)
        if status != 200:
            return False, f"Status {status}"
        if data.get("total", 0) < 30:
            return False, f"Expected at least 30, got {data.get('total')}"
        return True, ""

    @test("Category filter returns only Sweeteners")
    def test_category_filter(self) -> Tuple[bool, str]:
        status, data = api_get(self.base_url, "/ingredients/list?category=Sweeteners", self.verbose)
        if status != 200:
            return False, f"Status {status}"

        ingredients = data.get("ingredients", [])
        non_sweeteners = [i for i in ingredients if i.get("category") != "Sweeteners"]

        if non_sweeteners:
            return False, f"Found non-sweeteners: {[i.get('name') for i in non_sweeteners[:3]]}"
        return True, ""

    @test("Sorting by overall score works")
    def test_sort_by_score(self) -> Tuple[bool, str]:
        status, data = api_get(self.base_url, "/ingredients/list?sort_by=overall&sort_order=desc&page_size=10", self.verbose)
        if status != 200:
            return False, f"Status {status}"

        ingredients = data.get("ingredients", [])
        scores = [i.get("overall_score", 0) or 0 for i in ingredients]

        # Check descending order
        for i in range(len(scores) - 1):
            if scores[i] < scores[i + 1]:
                return False, "Not sorted correctly (descending)"
        return True, ""

    # =========================================================================
    # Search Tests
    # =========================================================================

    @test("Search for 'sugar' returns results")
    def test_search_sugar(self) -> Tuple[bool, str]:
        status, data = api_get(self.base_url, "/ingredient/search?q=sugar", self.verbose)
        if status != 200:
            return False, f"Status {status}"

        results = data.get("results", [])
        if len(results) == 0:
            return False, "No results found"
        return True, ""

    @test("Search results include match_score")
    def test_search_match_score(self) -> Tuple[bool, str]:
        status, data = api_get(self.base_url, "/ingredient/search?q=stevia", self.verbose)
        if status != 200:
            return False, f"Status {status}"

        results = data.get("results", [])
        if not results:
            return False, "No results"
        if "match_score" not in results[0]:
            return False, "match_score missing"
        return True, ""

    # =========================================================================
    # Error Handling Tests
    # =========================================================================

    @test("Non-existent ingredient returns 404")
    def test_not_found(self) -> Tuple[bool, str]:
        status, data = api_get(self.base_url, "/ingredient/NonExistent12345xyz", self.verbose)
        if status != 404:
            return False, f"Expected 404, got {status}"
        return True, ""

    def run_all(self) -> bool:
        """Run all tests and return True if all passed."""
        print(f"\n🔍 Testing Production API: {self.base_url}")
        print("=" * 60)

        # Health & Basic
        print("\n📋 Health & Basic Tests:")
        self.test_health_check()
        self.test_production_environment()

        # Categories
        print("\n📁 Categories Tests:")
        self.test_categories_endpoint()
        self.test_sweeteners_category()
        self.test_fats_oils_category()

        # Ingredient Detail
        print("\n🧪 Ingredient Detail Tests:")
        self.test_stevia_overall_score()
        self.test_stevia_health_scores()
        self.test_stevia_health_categories()
        self.test_stevia_is_trusted()
        self.test_stevia_category()
        self.test_stevia_sources()
        self.test_olive_oil_score()
        self.test_olive_oil_category()
        self.test_sugar_score()

        # Ingredients List
        print("\n📃 Ingredients List Tests:")
        self.test_list_pagination()
        self.test_list_total()
        self.test_category_filter()
        self.test_sort_by_score()

        # Search
        print("\n🔎 Search Tests:")
        self.test_search_sugar()
        self.test_search_match_score()

        # Error Handling
        print("\n⚠️  Error Handling Tests:")
        self.test_not_found()

        # Summary
        print("\n" + "=" * 60)
        print(f"\n📊 Results: {PASSED} passed, {FAILED} failed")

        if FAILED > 0:
            print(f"\n❌ Failed Tests:")
            for error in ERRORS:
                print(f"   • {error}")
            print("")
            return False
        else:
            print("\n✅ All production API tests passed!")
            return True


def main():
    parser = argparse.ArgumentParser(description="Test Aurea Production API")
    parser.add_argument(
        "--base-url",
        default=DEFAULT_BASE_URL,
        help=f"Base URL for API (default: {DEFAULT_BASE_URL})"
    )
    parser.add_argument(
        "--verbose", "-v",
        action="store_true",
        help="Show verbose output including request URLs"
    )

    args = parser.parse_args()

    tests = ProductionAPITests(args.base_url, args.verbose)
    success = tests.run_all()

    sys.exit(0 if success else 1)


if __name__ == "__main__":
    main()
