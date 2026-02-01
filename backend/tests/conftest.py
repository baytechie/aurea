"""
Pytest Configuration and Fixtures for Aurea Backend Tests.

This file provides:
- Test database setup and teardown
- FastAPI test client fixture
- Test data fixtures for ingredients
- Helper functions for test assertions

Usage:
    Fixtures are automatically available to all test files in the tests/ directory.

    Run tests with: pytest tests/ -v
"""

import pytest
import json
import sqlite3
import tempfile
import os
from pathlib import Path
from typing import Dict, List, Generator, Any
from datetime import datetime

# Add backend to path
import sys
sys.path.insert(0, str(Path(__file__).parent.parent))


# =============================================================================
# Test Database Configuration
# =============================================================================

@pytest.fixture(scope="session")
def test_db_path():
    """
    Create a temporary database path for testing.

    Uses a temp file that persists for the entire test session,
    then is cleaned up automatically when tests complete.
    """
    # Use the actual database for integration tests
    from app.core.config import settings
    db_url = settings.DATABASE_URL

    if db_url.startswith('sqlite:///'):
        return db_url[10:]  # Remove 'sqlite:///'

    # Fallback to temp database for isolated tests
    fd, path = tempfile.mkstemp(suffix='.db')
    os.close(fd)
    yield path
    # Cleanup
    if os.path.exists(path):
        os.unlink(path)


@pytest.fixture(scope="function")
def db_connection(test_db_path):
    """
    Provide a database connection for each test function.

    Connection is automatically closed after each test.
    """
    conn = sqlite3.connect(test_db_path)
    conn.row_factory = sqlite3.Row  # Enable column access by name
    yield conn
    conn.close()


@pytest.fixture(scope="session")
def test_client():
    """
    Create a FastAPI TestClient for API endpoint testing.

    Uses the actual application instance with real database.
    """
    from fastapi.testclient import TestClient
    from app.main import app

    client = TestClient(app)
    return client


@pytest.fixture(scope="session")
def async_test_client():
    """
    Create an async test client for async endpoint testing.
    """
    from httpx import AsyncClient, ASGITransport
    from app.main import app

    transport = ASGITransport(app=app)
    return AsyncClient(transport=transport, base_url="http://test")


# =============================================================================
# Test Data Fixtures
# =============================================================================

@pytest.fixture(scope="session")
def expected_sweeteners() -> List[Dict[str, Any]]:
    """
    Expected sweetener data for verification tests.

    Contains the 15 sweeteners with their expected overall scores
    and blood sugar impact scores.
    """
    return [
        {"name": "sugar (white, brown)", "overall": 22, "blood_sugar": 10, "category": "Sweeteners"},
        {"name": "high-fructose corn syrup", "overall": 21, "blood_sugar": 10, "category": "Sweeteners"},
        {"name": "honey", "overall": 40, "blood_sugar": 25, "category": "Sweeteners"},
        {"name": "maple syrup", "overall": 41, "blood_sugar": 30, "category": "Sweeteners"},
        {"name": "agave nectar", "overall": 32, "blood_sugar": 35, "category": "Sweeteners"},
        {"name": "molasses", "overall": 41, "blood_sugar": 35, "category": "Sweeteners"},
        {"name": "stevia", "overall": 79, "blood_sugar": 90, "category": "Sweeteners"},
        {"name": "erythritol", "overall": 70, "blood_sugar": 95, "category": "Sweeteners"},
        {"name": "xylitol", "overall": 60, "blood_sugar": 80, "category": "Sweeteners"},
        {"name": "maltose", "overall": 23, "blood_sugar": 5, "category": "Sweeteners"},
        {"name": "dextrose", "overall": 23, "blood_sugar": 5, "category": "Sweeteners"},
        {"name": "glucose syrup", "overall": 23, "blood_sugar": 5, "category": "Sweeteners"},
        {"name": "fructose", "overall": 39, "blood_sugar": 60, "category": "Sweeteners"},
        {"name": "invert sugar", "overall": 24, "blood_sugar": 10, "category": "Sweeteners"},
        {"name": "sorbitol", "overall": 59, "blood_sugar": 80, "category": "Sweeteners"},
    ]


@pytest.fixture(scope="session")
def expected_fats_oils() -> List[Dict[str, Any]]:
    """
    Expected fats and oils data for verification tests.

    Contains the 15 fats and oils with their expected scores.
    """
    return [
        {"name": "butter", "overall": 65, "blood_sugar": 95, "category": "Fats & Oils"},
        {"name": "margarine", "overall": 60, "blood_sugar": 85, "category": "Fats & Oils"},
        {"name": "vegetable oil", "overall": 72, "blood_sugar": 95, "category": "Fats & Oils"},
        {"name": "canola oil", "overall": 82, "blood_sugar": 98, "category": "Fats & Oils"},
        {"name": "sunflower oil", "overall": 59, "blood_sugar": 65, "category": "Fats & Oils"},
        {"name": "olive oil", "overall": 85, "blood_sugar": 85, "category": "Fats & Oils"},
        {"name": "coconut oil", "overall": 53, "blood_sugar": 55, "category": "Fats & Oils"},
        {"name": "palm oil", "overall": 54, "blood_sugar": 55, "category": "Fats & Oils"},
        {"name": "shortening", "overall": 47, "blood_sugar": 45, "category": "Fats & Oils"},
        {"name": "lard", "overall": 53, "blood_sugar": 55, "category": "Fats & Oils"},
        {"name": "ghee", "overall": 57, "blood_sugar": 60, "category": "Fats & Oils"},
        {"name": "peanut oil", "overall": 67, "blood_sugar": 75, "category": "Fats & Oils"},
        {"name": "soybean oil", "overall": 56, "blood_sugar": 55, "category": "Fats & Oils"},
        {"name": "fish oil", "overall": 75, "blood_sugar": 70, "category": "Fats & Oils"},
        {"name": "avocado oil", "overall": 75, "blood_sugar": 75, "category": "Fats & Oils"},
    ]


@pytest.fixture(scope="session")
def all_expected_ingredients(expected_sweeteners, expected_fats_oils) -> List[Dict[str, Any]]:
    """Combined list of all 30 expected ingredients."""
    return expected_sweeteners + expected_fats_oils


@pytest.fixture(scope="session")
def key_ingredients() -> Dict[str, Dict[str, Any]]:
    """
    Key ingredients for quick validation tests.

    These are the specific ingredients mentioned in the requirements
    for targeted testing.
    """
    return {
        "sugar": {
            "name": "sugar (white, brown)",
            "overall_score": 22,
            "blood_sugar": 10,
            "category": "Sweeteners"
        },
        "stevia": {
            "name": "stevia",
            "overall_score": 79,
            "blood_sugar": 90,
            "category": "Sweeteners"
        },
        "olive_oil": {
            "name": "olive oil",
            "overall_score": 85,
            "blood_sugar": 85,
            "category": "Fats & Oils"
        },
        "hfcs": {
            "name": "high-fructose corn syrup",
            "overall_score": 21,
            "blood_sugar": 10,
            "category": "Sweeteners"
        },
        "canola_oil": {
            "name": "canola oil",
            "overall_score": 82,
            "blood_sugar": 98,
            "category": "Fats & Oils"
        }
    }


# =============================================================================
# Score Color Logic Fixtures
# =============================================================================

@pytest.fixture(scope="session")
def score_color_ranges():
    """
    Score color thresholds for testing UI color logic.

    Color coding:
    - Green (70-100): Good, low concern
    - Yellow (40-69): Moderate concern
    - Red (0-39): High concern
    """
    return {
        "green": {"min": 70, "max": 100, "color": "#22C55E", "label": "Good"},
        "yellow": {"min": 40, "max": 69, "color": "#EAB308", "label": "Moderate"},
        "red": {"min": 0, "max": 39, "color": "#EF4444", "label": "Caution"},
    }


# =============================================================================
# Helper Functions
# =============================================================================

def get_score_color(score: int) -> str:
    """
    Get the expected color for a given score.

    Matches the frontend getSimpleScoreColor function.
    """
    if score >= 70:
        return "#22C55E"  # Green
    elif score >= 40:
        return "#EAB308"  # Yellow
    else:
        return "#EF4444"  # Red


def get_score_label(score: int) -> str:
    """
    Get the expected label for a given score.

    Matches the frontend getSimpleScoreLabel function.
    """
    if score >= 70:
        return "Good"
    elif score >= 40:
        return "Moderate"
    else:
        return "Caution"


def transform_inflammation_score(db_score: int) -> int:
    """
    Transform inflammation score for display.

    In the DB, higher = more inflammatory.
    For display, higher = less inflammatory (better).

    Display score = 100 - DB score
    """
    if db_score is None:
        return None
    return 100 - db_score


@pytest.fixture(scope="session")
def score_helpers():
    """Provide score helper functions to tests."""
    return {
        "get_color": get_score_color,
        "get_label": get_score_label,
        "transform_inflammation": transform_inflammation_score,
    }


# =============================================================================
# API Response Validators
# =============================================================================

def validate_ingredient_detail_response(data: dict) -> List[str]:
    """
    Validate that an ingredient detail response has all required fields.

    Returns a list of missing or invalid fields.
    """
    errors = []

    # Required top-level fields
    required_fields = ["name", "overall_score", "category", "is_trusted"]
    for field in required_fields:
        if field not in data:
            errors.append(f"Missing required field: {field}")

    # health_scores structure
    if "health_scores" not in data:
        errors.append("Missing health_scores object")
    else:
        health_scores = data["health_scores"]
        expected_categories = ["blood_sugar", "inflammation", "gut_impact", "disease_links", "hormonal"]
        for cat in expected_categories:
            if cat not in health_scores:
                errors.append(f"Missing health category: {cat}")
            elif health_scores[cat] is not None:
                # Validate nested structure
                if "score" not in health_scores[cat]:
                    errors.append(f"{cat} missing 'score' field")

    return errors


def validate_ingredient_list_response(data: dict) -> List[str]:
    """
    Validate that an ingredient list response has correct structure.

    Returns a list of errors found.
    """
    errors = []

    # Required fields
    required = ["ingredients", "total", "page", "page_size", "total_pages"]
    for field in required:
        if field not in data:
            errors.append(f"Missing field: {field}")

    # Validate ingredients array
    if "ingredients" in data:
        if not isinstance(data["ingredients"], list):
            errors.append("ingredients should be a list")
        elif len(data["ingredients"]) > 0:
            # Validate first ingredient
            ing = data["ingredients"][0]
            ing_fields = ["name", "category", "overall_score"]
            for field in ing_fields:
                if field not in ing:
                    errors.append(f"Ingredient missing field: {field}")

    return errors


def validate_categories_response(data: dict) -> List[str]:
    """
    Validate that a categories response has correct structure.
    """
    errors = []

    if "categories" not in data:
        errors.append("Missing 'categories' field")
        return errors

    categories = data["categories"]
    if not isinstance(categories, list):
        errors.append("'categories' should be a list")
        return errors

    for cat in categories:
        if "name" not in cat:
            errors.append("Category missing 'name' field")
        if "count" not in cat:
            errors.append("Category missing 'count' field")

    return errors


@pytest.fixture(scope="session")
def validators():
    """Provide validation functions to tests."""
    return {
        "ingredient_detail": validate_ingredient_detail_response,
        "ingredient_list": validate_ingredient_list_response,
        "categories": validate_categories_response,
    }


# =============================================================================
# Markers Configuration
# =============================================================================

def pytest_configure(config):
    """Configure custom pytest markers."""
    config.addinivalue_line("markers", "slow: marks tests as slow (deselect with '-m \"not slow\"')")
    config.addinivalue_line("markers", "integration: marks tests that require database")
    config.addinivalue_line("markers", "api: marks tests that test API endpoints")
    config.addinivalue_line("markers", "schema: marks tests that verify database schema")
    config.addinivalue_line("markers", "data: marks tests that verify data integrity")
