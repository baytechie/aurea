# Aurea API Enhancement Specification

**Version:** 2.0.0
**Date:** January 20, 2026
**Status:** Draft
**Author:** API Design Architect

---

## Table of Contents

1. [Executive Summary](#1-executive-summary)
2. [Current vs Required API Comparison](#2-current-vs-required-api-comparison)
3. [New Endpoint Specifications](#3-new-endpoint-specifications)
4. [Enhanced Endpoint Specifications](#4-enhanced-endpoint-specifications)
5. [Request/Response Schemas](#5-requestresponse-schemas)
6. [Error Handling Patterns](#6-error-handling-patterns)
7. [Rate Limiting Strategy](#7-rate-limiting-strategy)
8. [Authentication Flow Details](#8-authentication-flow-details)
9. [OpenAPI Specification](#9-openapi-specification)
10. [Migration Guide](#10-migration-guide)

---

## 1. Executive Summary

This document outlines the API enhancements required to bring Aurea from its current framework state to a fully functional personal ingredient and symptom predictor platform. The enhancements focus on four key areas:

1. **Ingredient Autocomplete** - Fuzzy matching search for better UX
2. **Enhanced Predictions** - Confidence intervals and detailed symptom predictions
3. **Advanced Insights** - Lag analysis, cycle patterns, and personalized recommendations
4. **User Profile Management** - Cycle tracking preferences and user settings

### Key Additions

| Category | Current Endpoints | New/Enhanced Endpoints |
|----------|-------------------|------------------------|
| Ingredients | 1 | +2 (search, autocomplete) |
| Predictions | 2 | Enhanced with confidence intervals |
| Insights | 1 | Enhanced + 2 new sub-endpoints |
| User Profile | 0 | +4 (CRUD + preferences) |
| **Total** | **12** | **18** |

---

## 2. Current vs Required API Comparison

### 2.1 Existing Endpoints Analysis

| Endpoint | Method | Current Status | Gap Analysis |
|----------|--------|----------------|--------------|
| `/health` | GET | Complete | No changes needed |
| `/auth/signup` | POST | Complete | Add profile fields |
| `/auth/login` | POST | Complete | Return user preferences |
| `/ingredient/{name}` | GET | Partial (stub) | Need fuzzy matching fallback |
| `/logs` | POST | Complete | Add meal_type field |
| `/logs` | GET | Complete | Add pagination |
| `/logs/{date}` | GET | Complete | No changes needed |
| `/logs/{id}` | DELETE | Complete | No changes needed |
| `/predictions` | GET | Partial (stub) | Add confidence intervals |
| `/predictions` | POST | Partial (stub) | Add detailed symptom breakdown |
| `/insights` | GET | Partial (stub) | Add lag analysis, cycle patterns |

### 2.2 Missing Endpoints

| Endpoint | Method | Priority | Description |
|----------|--------|----------|-------------|
| `/ingredients/search` | GET | P0 | Search with query string |
| `/ingredients/autocomplete` | GET | P0 | Fuzzy matching for typing |
| `/users/me` | GET | P0 | Get current user profile |
| `/users/me` | PUT | P0 | Update user profile |
| `/users/me/preferences` | GET | P1 | Get user preferences |
| `/users/me/preferences` | PUT | P1 | Update preferences |
| `/insights/triggers` | GET | P1 | Detailed trigger analysis |
| `/insights/cycles` | GET | P1 | Cycle pattern analysis |
| `/auth/refresh` | POST | P2 | Refresh JWT token |
| `/auth/logout` | POST | P2 | Invalidate token (if using blocklist) |

### 2.3 Response Field Gaps

#### IngredientScoreResponse - Missing Fields

```diff
  IngredientScoreResponse:
    name: string
    blood_sugar_impact: integer
    inflammation_potential: integer
    gut_impact: integer
    overall_score: integer
    hormonal_relevance: object
    evidence_confidence: string
    sources: array
+   aliases: array           # Alternative names for ingredient
+   category: string         # Food category (grain, vegetable, etc.)
+   common_in: array         # Common foods containing this ingredient
+   warnings: array          # Health warnings or interactions
```

#### PredictionResponse - Missing Fields

```diff
  PredictionResponse:
    id: uuid
    predicted_date: date
    ingredients: array
    predicted_bloating_probability: float
    predicted_symptoms: object
    confidence: string
+   confidence_interval: object    # Lower and upper bounds
+   contributing_factors: array    # Which ingredients drive prediction
+   risk_level: string            # low/moderate/high
+   personalization_score: float  # How personalized (based on data points)
    interpretation: string
    created_at: datetime
```

#### InsightsResponse - Missing Fields

```diff
  InsightsResponse:
    top_triggers: array
    phase_analysis: object
    lag_analysis: object
+   lag_analysis.delays: array       # Specific delay patterns
+   lag_analysis.peak_effect_hours: integer
    confidence_assessment: string
    recommendations: array
+   data_quality: object            # Data sufficiency metrics
+   cycle_patterns: object          # Menstrual cycle correlations
+   weekly_patterns: object         # Day-of-week patterns
+   time_series_trend: object       # Overall health trajectory
```

---

## 3. New Endpoint Specifications

### 3.1 Ingredient Autocomplete

**Endpoint:** `GET /ingredients/autocomplete`

**Description:** Provides real-time autocomplete suggestions as users type ingredient names. Implements fuzzy matching to handle typos and partial matches.

**Query Parameters:**

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `q` | string | Yes | - | Search query (min 2 characters) |
| `limit` | integer | No | 10 | Max results (1-50) |
| `include_scores` | boolean | No | false | Include health scores in results |

**Request Example:**

```http
GET /ingredients/autocomplete?q=brocco&limit=5&include_scores=true
Authorization: Bearer <token>
```

**Response (200 OK):**

```json
{
  "data": [
    {
      "name": "broccoli",
      "display_name": "Broccoli",
      "match_score": 0.95,
      "category": "vegetable",
      "scores": {
        "overall_score": 85,
        "blood_sugar_impact": 90,
        "inflammation_potential": 15,
        "gut_impact": 80
      }
    },
    {
      "name": "broccoli rabe",
      "display_name": "Broccoli Rabe",
      "match_score": 0.82,
      "category": "vegetable",
      "scores": {
        "overall_score": 82,
        "blood_sugar_impact": 88,
        "inflammation_potential": 18,
        "gut_impact": 75
      }
    }
  ],
  "meta": {
    "query": "brocco",
    "total_matches": 2,
    "search_time_ms": 15
  }
}
```

**Fuzzy Matching Algorithm:**

The autocomplete uses a multi-tier matching strategy:

1. **Prefix Match (Priority 1):** Ingredients starting with the query
2. **Contains Match (Priority 2):** Ingredients containing the query
3. **Levenshtein Distance (Priority 3):** Similar ingredients within edit distance 2
4. **Phonetic Match (Priority 4):** Soundex/Metaphone for pronunciation similarity

**Error Responses:**

| Status | Code | Message |
|--------|------|---------|
| 400 | `QUERY_TOO_SHORT` | Query must be at least 2 characters |
| 429 | `RATE_LIMIT_EXCEEDED` | Too many requests |

---

### 3.2 Ingredient Search

**Endpoint:** `GET /ingredients/search`

**Description:** Full-text search across ingredients with filtering and pagination. Returns detailed ingredient information.

**Query Parameters:**

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `q` | string | Yes | - | Search query |
| `category` | string | No | - | Filter by category |
| `min_score` | integer | No | 0 | Minimum overall score (0-100) |
| `max_inflammation` | integer | No | 100 | Maximum inflammation score |
| `page` | integer | No | 1 | Page number |
| `limit` | integer | No | 20 | Results per page (1-100) |
| `sort` | string | No | `relevance` | Sort field |
| `order` | string | No | `desc` | Sort order (asc/desc) |

**Valid Sort Fields:** `relevance`, `overall_score`, `name`, `inflammation_potential`

**Request Example:**

```http
GET /ingredients/search?q=sugar&category=sweetener&max_inflammation=50&limit=10
Authorization: Bearer <token>
```

**Response (200 OK):**

```json
{
  "data": [
    {
      "name": "stevia",
      "display_name": "Stevia",
      "category": "sweetener",
      "overall_score": 75,
      "blood_sugar_impact": 95,
      "inflammation_potential": 10,
      "gut_impact": 70,
      "hormonal_relevance": {
        "score": 65,
        "estrogen_impact": "minimal",
        "insulin_impact": "low"
      },
      "evidence_confidence": "high",
      "aliases": ["stevia leaf", "stevia extract"],
      "common_in": ["diet sodas", "sugar-free gum", "protein bars"],
      "warnings": []
    }
  ],
  "meta": {
    "total": 15,
    "page": 1,
    "limit": 10,
    "total_pages": 2,
    "query": "sugar",
    "filters_applied": {
      "category": "sweetener",
      "max_inflammation": 50
    }
  },
  "links": {
    "self": "/ingredients/search?q=sugar&category=sweetener&max_inflammation=50&page=1&limit=10",
    "next": "/ingredients/search?q=sugar&category=sweetener&max_inflammation=50&page=2&limit=10",
    "prev": null
  }
}
```

---

### 3.3 User Profile Endpoints

#### 3.3.1 Get Current User

**Endpoint:** `GET /users/me`

**Description:** Retrieves the authenticated user's profile information.

**Response (200 OK):**

```json
{
  "data": {
    "id": "550e8400-e29b-41d4-a716-446655440000",
    "email": "user@example.com",
    "created_at": "2025-06-15T10:30:00Z",
    "profile": {
      "display_name": "Jane",
      "timezone": "America/New_York",
      "cycle_tracking_enabled": true,
      "cycle_length_days": 28,
      "last_period_start": "2026-01-10"
    },
    "stats": {
      "total_logs": 45,
      "streak_days": 7,
      "data_quality_score": 0.85,
      "predictions_accuracy": 0.72
    }
  }
}
```

#### 3.3.2 Update User Profile

**Endpoint:** `PUT /users/me`

**Description:** Updates the authenticated user's profile.

**Request Body:**

```json
{
  "display_name": "Jane Doe",
  "timezone": "America/Los_Angeles",
  "cycle_tracking_enabled": true,
  "cycle_length_days": 30,
  "last_period_start": "2026-01-12"
}
```

**Response (200 OK):** Returns updated user profile (same structure as GET).

#### 3.3.3 Get User Preferences

**Endpoint:** `GET /users/me/preferences`

**Description:** Retrieves user preferences for app behavior and notifications.

**Response (200 OK):**

```json
{
  "data": {
    "notifications": {
      "daily_reminder": true,
      "reminder_time": "20:00",
      "weekly_insights": true,
      "prediction_alerts": true
    },
    "privacy": {
      "data_sharing_analytics": false,
      "data_sharing_research": false
    },
    "display": {
      "theme": "system",
      "show_cycle_phase": true,
      "default_symptom_view": "detailed"
    },
    "tracking": {
      "symptoms_tracked": ["energy", "bloating", "focus", "mood", "sleep"],
      "custom_symptoms": ["headache", "cramps"],
      "default_meal_types": ["breakfast", "lunch", "dinner", "snack"]
    }
  }
}
```

#### 3.3.4 Update User Preferences

**Endpoint:** `PUT /users/me/preferences`

**Description:** Updates user preferences. Supports partial updates.

**Request Body (partial update):**

```json
{
  "notifications": {
    "daily_reminder": false
  },
  "tracking": {
    "custom_symptoms": ["headache", "cramps", "nausea"]
  }
}
```

**Response (200 OK):** Returns full preferences object with updates applied.

---

### 3.4 Advanced Insights Endpoints

#### 3.4.1 Trigger Analysis

**Endpoint:** `GET /insights/triggers`

**Description:** Detailed analysis of ingredient-symptom correlations.

**Query Parameters:**

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `symptom` | string | No | - | Filter by specific symptom |
| `min_correlation` | float | No | 0.3 | Minimum correlation threshold |
| `period_days` | integer | No | 30 | Analysis period |

**Response (200 OK):**

```json
{
  "data": {
    "triggers": [
      {
        "ingredient": "dairy",
        "overall_correlation": 0.72,
        "symptom_correlations": {
          "bloating": 0.82,
          "energy": -0.45,
          "focus": -0.38
        },
        "occurrence_count": 15,
        "confidence": "high",
        "lag_effect_hours": 4,
        "cycle_phase_impact": {
          "luteal": 0.85,
          "follicular": 0.65,
          "ovulation": 0.70,
          "menstruation": 0.78
        }
      },
      {
        "ingredient": "gluten",
        "overall_correlation": 0.65,
        "symptom_correlations": {
          "bloating": 0.75,
          "focus": -0.52,
          "mood": -0.35
        },
        "occurrence_count": 22,
        "confidence": "high",
        "lag_effect_hours": 6,
        "cycle_phase_impact": {
          "luteal": 0.80,
          "follicular": 0.55,
          "ovulation": 0.60,
          "menstruation": 0.72
        }
      }
    ],
    "analysis_metadata": {
      "period_start": "2025-12-21",
      "period_end": "2026-01-20",
      "total_logs_analyzed": 30,
      "unique_ingredients": 45,
      "statistical_method": "pearson_correlation"
    }
  }
}
```

#### 3.4.2 Cycle Pattern Analysis

**Endpoint:** `GET /insights/cycles`

**Description:** Analysis of symptom patterns across menstrual cycle phases.

**Query Parameters:**

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `cycles_back` | integer | No | 3 | Number of past cycles to analyze |

**Response (200 OK):**

```json
{
  "data": {
    "cycle_enabled": true,
    "current_phase": "luteal",
    "current_cycle_day": 22,
    "phase_patterns": {
      "menstruation": {
        "days": [1, 2, 3, 4, 5],
        "avg_symptoms": {
          "energy": 2.5,
          "bloating": 3.2,
          "mood": 2.8,
          "focus": 3.0,
          "sleep": 3.5
        },
        "worst_triggers": ["caffeine", "salt"],
        "best_foods": ["iron-rich foods", "dark chocolate"],
        "recommendation": "Increase iron intake, reduce caffeine"
      },
      "follicular": {
        "days": [6, 7, 8, 9, 10, 11, 12, 13],
        "avg_symptoms": {
          "energy": 4.2,
          "bloating": 1.5,
          "mood": 4.0,
          "focus": 4.3,
          "sleep": 4.0
        },
        "worst_triggers": [],
        "best_foods": ["fermented foods", "leafy greens"],
        "recommendation": "Good time for trying new foods"
      },
      "ovulation": {
        "days": [14, 15, 16],
        "avg_symptoms": {
          "energy": 4.5,
          "bloating": 1.8,
          "mood": 4.2,
          "focus": 4.0,
          "sleep": 3.8
        },
        "worst_triggers": ["alcohol"],
        "best_foods": ["antioxidant-rich foods"],
        "recommendation": "Peak energy - maintain balanced diet"
      },
      "luteal": {
        "days": [17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28],
        "avg_symptoms": {
          "energy": 3.0,
          "bloating": 3.5,
          "mood": 2.9,
          "focus": 3.2,
          "sleep": 3.3
        },
        "worst_triggers": ["sugar", "dairy", "salt"],
        "best_foods": ["complex carbs", "magnesium-rich foods"],
        "recommendation": "Avoid inflammatory foods, increase magnesium"
      }
    },
    "prediction_for_next_week": {
      "expected_phase": "menstruation",
      "phase_start_date": "2026-01-25",
      "foods_to_avoid": ["dairy", "excessive caffeine"],
      "foods_to_prioritize": ["spinach", "lentils", "dark chocolate"]
    },
    "analysis_metadata": {
      "cycles_analyzed": 3,
      "data_quality": "good",
      "confidence": "medium"
    }
  }
}
```

---

## 4. Enhanced Endpoint Specifications

### 4.1 Enhanced Predictions

**Endpoint:** `POST /predictions` (Enhanced)

**Request Body:**

```json
{
  "ingredients": ["dairy", "wheat", "sugar"],
  "cycle_phase": "luteal",
  "meal_type": "lunch",
  "include_confidence_intervals": true,
  "include_contributing_factors": true
}
```

**Response (200 OK):**

```json
{
  "data": {
    "id": "550e8400-e29b-41d4-a716-446655440001",
    "predicted_date": "2026-01-20",
    "ingredients": ["dairy", "wheat", "sugar"],
    "cycle_phase": "luteal",
    "predictions": {
      "bloating": {
        "probability": 0.78,
        "confidence_interval": {
          "lower": 0.65,
          "upper": 0.88
        },
        "severity_prediction": "moderate",
        "peak_time_hours": 4
      },
      "energy": {
        "probability": 0.62,
        "confidence_interval": {
          "lower": 0.48,
          "upper": 0.74
        },
        "direction": "decrease",
        "severity_prediction": "mild"
      },
      "focus": {
        "probability": 0.55,
        "confidence_interval": {
          "lower": 0.40,
          "upper": 0.68
        },
        "direction": "decrease",
        "severity_prediction": "mild"
      }
    },
    "overall_risk_level": "moderate",
    "contributing_factors": [
      {
        "ingredient": "dairy",
        "contribution_weight": 0.45,
        "affected_symptoms": ["bloating", "energy"],
        "historical_impact": "You've had bloating 80% of the time after dairy in luteal phase"
      },
      {
        "ingredient": "sugar",
        "contribution_weight": 0.30,
        "affected_symptoms": ["energy", "focus"],
        "historical_impact": "Sugar typically causes energy dip 2-3 hours later"
      },
      {
        "ingredient": "wheat",
        "contribution_weight": 0.25,
        "affected_symptoms": ["bloating"],
        "historical_impact": "Wheat has moderate correlation with bloating for you"
      }
    ],
    "personalization_metrics": {
      "data_points_used": 45,
      "personalization_score": 0.82,
      "model_accuracy_estimate": 0.75
    },
    "interpretation": "Based on your history, this combination is likely to cause moderate bloating within 4 hours, especially given you're in the luteal phase. Dairy is the primary contributor. Consider substituting with a non-dairy alternative.",
    "alternatives_suggestion": [
      {
        "replace": "dairy",
        "with": "oat milk",
        "predicted_improvement": 0.35
      }
    ],
    "created_at": "2026-01-20T12:30:00Z"
  }
}
```

### 4.2 Enhanced Insights

**Endpoint:** `GET /insights` (Enhanced)

**Response (200 OK):**

```json
{
  "data": {
    "top_triggers": [
      {
        "ingredient": "dairy",
        "correlation": 0.72,
        "affected_symptoms": ["bloating", "energy"],
        "frequency": "15 times in 30 days",
        "confidence": "high",
        "action_recommendation": "Try eliminating for 2 weeks"
      },
      {
        "ingredient": "gluten",
        "correlation": 0.65,
        "affected_symptoms": ["bloating", "focus"],
        "frequency": "22 times in 30 days",
        "confidence": "high",
        "action_recommendation": "Consider reducing intake"
      }
    ],
    "phase_analysis": {
      "current_phase": "luteal",
      "phase_specific_triggers": ["sugar", "salt", "dairy"],
      "phase_specific_recommendations": [
        "Increase magnesium-rich foods",
        "Avoid processed sugars",
        "Stay hydrated"
      ],
      "comparison_to_other_phases": {
        "bloating_increase": "+45% compared to follicular",
        "energy_decrease": "-20% compared to ovulation"
      }
    },
    "lag_analysis": {
      "overall_pattern": "Most symptoms appear 2-6 hours after consumption",
      "delays": [
        {
          "ingredient": "dairy",
          "symptom": "bloating",
          "typical_delay_hours": 4,
          "range_hours": {
            "min": 2,
            "max": 8
          }
        },
        {
          "ingredient": "caffeine",
          "symptom": "sleep",
          "typical_delay_hours": 8,
          "range_hours": {
            "min": 6,
            "max": 12
          }
        },
        {
          "ingredient": "sugar",
          "symptom": "energy",
          "typical_delay_hours": 2,
          "range_hours": {
            "min": 1,
            "max": 4
          }
        }
      ],
      "peak_symptom_times": {
        "bloating": "4-6 hours post-meal",
        "energy_dip": "2-3 hours post-meal",
        "focus_issues": "3-4 hours post-meal"
      }
    },
    "weekly_patterns": {
      "best_days": ["Tuesday", "Wednesday"],
      "worst_days": ["Saturday", "Sunday"],
      "weekend_vs_weekday": "Symptoms are 30% worse on weekends",
      "likely_cause": "Diet changes and alcohol consumption"
    },
    "data_quality": {
      "total_logs": 45,
      "consistency_score": 0.85,
      "completeness_score": 0.78,
      "minimum_for_insights": 14,
      "minimum_for_predictions": 21,
      "recommendations": [
        "Log consistently every day for better insights",
        "Add cycle phase data for personalized recommendations"
      ]
    },
    "health_trajectory": {
      "trend": "improving",
      "change_30_days": "+12% overall symptom improvement",
      "contributing_changes": [
        "Reduced dairy intake by 40%",
        "More consistent sleep schedule"
      ]
    },
    "confidence_assessment": "high",
    "recommendations": [
      {
        "priority": 1,
        "action": "Eliminate dairy for 2 weeks",
        "expected_impact": "40% reduction in bloating",
        "difficulty": "moderate"
      },
      {
        "priority": 2,
        "action": "Avoid sugar in luteal phase",
        "expected_impact": "25% improvement in energy",
        "difficulty": "moderate"
      },
      {
        "priority": 3,
        "action": "Log cycle phase consistently",
        "expected_impact": "Better personalized predictions",
        "difficulty": "easy"
      }
    ],
    "generated_at": "2026-01-20T12:30:00Z"
  }
}
```

---

## 5. Request/Response Schemas

### 5.1 New Pydantic Schemas

```python
# schemas.py additions

from pydantic import BaseModel, Field, EmailStr
from typing import Optional, List, Dict, Any
from datetime import date, datetime
from uuid import UUID
from enum import Enum


# ============================================================
# Enums
# ============================================================

class CyclePhase(str, Enum):
    MENSTRUATION = "menstruation"
    FOLLICULAR = "follicular"
    OVULATION = "ovulation"
    LUTEAL = "luteal"


class MealType(str, Enum):
    BREAKFAST = "breakfast"
    LUNCH = "lunch"
    DINNER = "dinner"
    SNACK = "snack"


class ConfidenceLevel(str, Enum):
    HIGH = "high"
    MEDIUM = "medium"
    LOW = "low"


class RiskLevel(str, Enum):
    LOW = "low"
    MODERATE = "moderate"
    HIGH = "high"


class Theme(str, Enum):
    LIGHT = "light"
    DARK = "dark"
    SYSTEM = "system"


# ============================================================
# Autocomplete Schemas
# ============================================================

class AutocompleteItem(BaseModel):
    """Single autocomplete suggestion."""
    name: str
    display_name: str
    match_score: float = Field(..., ge=0, le=1)
    category: Optional[str] = None
    scores: Optional[Dict[str, int]] = None


class AutocompleteResponse(BaseModel):
    """Autocomplete response with suggestions."""
    data: List[AutocompleteItem]
    meta: Dict[str, Any]


# ============================================================
# Enhanced Ingredient Schemas
# ============================================================

class IngredientSearchItem(BaseModel):
    """Full ingredient info for search results."""
    name: str
    display_name: str
    category: str
    overall_score: Optional[int] = None
    blood_sugar_impact: Optional[int] = None
    inflammation_potential: Optional[int] = None
    gut_impact: Optional[int] = None
    hormonal_relevance: Optional[Dict[str, Any]] = None
    evidence_confidence: Optional[ConfidenceLevel] = None
    aliases: List[str] = []
    common_in: List[str] = []
    warnings: List[str] = []


class IngredientSearchResponse(BaseModel):
    """Paginated ingredient search response."""
    data: List[IngredientSearchItem]
    meta: Dict[str, Any]
    links: Dict[str, Optional[str]]


# ============================================================
# User Profile Schemas
# ============================================================

class UserProfile(BaseModel):
    """User profile information."""
    display_name: Optional[str] = None
    timezone: str = "UTC"
    cycle_tracking_enabled: bool = False
    cycle_length_days: int = Field(default=28, ge=21, le=35)
    last_period_start: Optional[date] = None


class UserStats(BaseModel):
    """User statistics."""
    total_logs: int
    streak_days: int
    data_quality_score: float = Field(..., ge=0, le=1)
    predictions_accuracy: Optional[float] = Field(None, ge=0, le=1)


class UserProfileResponse(BaseModel):
    """Full user profile response."""
    id: UUID
    email: str
    created_at: datetime
    profile: UserProfile
    stats: UserStats


class UserProfileUpdate(BaseModel):
    """User profile update request."""
    display_name: Optional[str] = None
    timezone: Optional[str] = None
    cycle_tracking_enabled: Optional[bool] = None
    cycle_length_days: Optional[int] = Field(None, ge=21, le=35)
    last_period_start: Optional[date] = None


# ============================================================
# User Preferences Schemas
# ============================================================

class NotificationPreferences(BaseModel):
    """Notification settings."""
    daily_reminder: bool = True
    reminder_time: str = "20:00"
    weekly_insights: bool = True
    prediction_alerts: bool = True


class PrivacyPreferences(BaseModel):
    """Privacy settings."""
    data_sharing_analytics: bool = False
    data_sharing_research: bool = False


class DisplayPreferences(BaseModel):
    """Display settings."""
    theme: Theme = Theme.SYSTEM
    show_cycle_phase: bool = True
    default_symptom_view: str = "detailed"


class TrackingPreferences(BaseModel):
    """Tracking settings."""
    symptoms_tracked: List[str] = ["energy", "bloating", "focus", "mood", "sleep"]
    custom_symptoms: List[str] = []
    default_meal_types: List[str] = ["breakfast", "lunch", "dinner", "snack"]


class UserPreferencesResponse(BaseModel):
    """Full user preferences."""
    notifications: NotificationPreferences
    privacy: PrivacyPreferences
    display: DisplayPreferences
    tracking: TrackingPreferences


class UserPreferencesUpdate(BaseModel):
    """Partial preferences update."""
    notifications: Optional[NotificationPreferences] = None
    privacy: Optional[PrivacyPreferences] = None
    display: Optional[DisplayPreferences] = None
    tracking: Optional[TrackingPreferences] = None


# ============================================================
# Enhanced Prediction Schemas
# ============================================================

class ConfidenceInterval(BaseModel):
    """Confidence interval for a prediction."""
    lower: float = Field(..., ge=0, le=1)
    upper: float = Field(..., ge=0, le=1)


class SymptomPrediction(BaseModel):
    """Detailed symptom prediction."""
    probability: float = Field(..., ge=0, le=1)
    confidence_interval: ConfidenceInterval
    severity_prediction: str  # mild, moderate, severe
    direction: Optional[str] = None  # increase, decrease
    peak_time_hours: Optional[int] = None


class ContributingFactor(BaseModel):
    """Factor contributing to prediction."""
    ingredient: str
    contribution_weight: float = Field(..., ge=0, le=1)
    affected_symptoms: List[str]
    historical_impact: str


class AlternativeSuggestion(BaseModel):
    """Suggested ingredient substitution."""
    replace: str
    with_ingredient: str = Field(..., alias="with")
    predicted_improvement: float = Field(..., ge=0, le=1)


class PersonalizationMetrics(BaseModel):
    """Metrics about prediction personalization."""
    data_points_used: int
    personalization_score: float = Field(..., ge=0, le=1)
    model_accuracy_estimate: float = Field(..., ge=0, le=1)


class EnhancedPredictionCreate(BaseModel):
    """Enhanced prediction request."""
    ingredients: List[str]
    cycle_phase: Optional[CyclePhase] = None
    meal_type: Optional[MealType] = None
    include_confidence_intervals: bool = True
    include_contributing_factors: bool = True


class EnhancedPredictionResponse(BaseModel):
    """Enhanced prediction response."""
    id: UUID
    predicted_date: date
    ingredients: List[str]
    cycle_phase: Optional[CyclePhase] = None
    predictions: Dict[str, SymptomPrediction]
    overall_risk_level: RiskLevel
    contributing_factors: List[ContributingFactor]
    personalization_metrics: PersonalizationMetrics
    interpretation: str
    alternatives_suggestion: List[AlternativeSuggestion]
    created_at: datetime


# ============================================================
# Enhanced Insights Schemas
# ============================================================

class TriggerDetail(BaseModel):
    """Detailed trigger information."""
    ingredient: str
    correlation: float = Field(..., ge=-1, le=1)
    affected_symptoms: List[str]
    frequency: str
    confidence: ConfidenceLevel
    action_recommendation: str


class LagDetail(BaseModel):
    """Lag effect detail."""
    ingredient: str
    symptom: str
    typical_delay_hours: int
    range_hours: Dict[str, int]


class LagAnalysis(BaseModel):
    """Comprehensive lag analysis."""
    overall_pattern: str
    delays: List[LagDetail]
    peak_symptom_times: Dict[str, str]


class PhaseAnalysis(BaseModel):
    """Cycle phase analysis."""
    current_phase: Optional[CyclePhase] = None
    phase_specific_triggers: List[str]
    phase_specific_recommendations: List[str]
    comparison_to_other_phases: Dict[str, str]


class WeeklyPatterns(BaseModel):
    """Weekly pattern analysis."""
    best_days: List[str]
    worst_days: List[str]
    weekend_vs_weekday: str
    likely_cause: str


class DataQuality(BaseModel):
    """Data quality metrics."""
    total_logs: int
    consistency_score: float = Field(..., ge=0, le=1)
    completeness_score: float = Field(..., ge=0, le=1)
    minimum_for_insights: int = 14
    minimum_for_predictions: int = 21
    recommendations: List[str]


class HealthTrajectory(BaseModel):
    """Health trend over time."""
    trend: str  # improving, declining, stable
    change_30_days: str
    contributing_changes: List[str]


class Recommendation(BaseModel):
    """Actionable recommendation."""
    priority: int = Field(..., ge=1, le=10)
    action: str
    expected_impact: str
    difficulty: str  # easy, moderate, hard


class EnhancedInsightsResponse(BaseModel):
    """Enhanced insights response."""
    top_triggers: List[TriggerDetail]
    phase_analysis: Optional[PhaseAnalysis] = None
    lag_analysis: LagAnalysis
    weekly_patterns: WeeklyPatterns
    data_quality: DataQuality
    health_trajectory: HealthTrajectory
    confidence_assessment: ConfidenceLevel
    recommendations: List[Recommendation]
    generated_at: datetime


# ============================================================
# Trigger Analysis Schemas
# ============================================================

class CyclePhaseImpact(BaseModel):
    """Impact by cycle phase."""
    luteal: float = Field(..., ge=0, le=1)
    follicular: float = Field(..., ge=0, le=1)
    ovulation: float = Field(..., ge=0, le=1)
    menstruation: float = Field(..., ge=0, le=1)


class DetailedTrigger(BaseModel):
    """Detailed trigger information."""
    ingredient: str
    overall_correlation: float = Field(..., ge=-1, le=1)
    symptom_correlations: Dict[str, float]
    occurrence_count: int
    confidence: ConfidenceLevel
    lag_effect_hours: int
    cycle_phase_impact: Optional[CyclePhaseImpact] = None


class TriggerAnalysisMetadata(BaseModel):
    """Metadata for trigger analysis."""
    period_start: date
    period_end: date
    total_logs_analyzed: int
    unique_ingredients: int
    statistical_method: str


class TriggerAnalysisResponse(BaseModel):
    """Trigger analysis response."""
    triggers: List[DetailedTrigger]
    analysis_metadata: TriggerAnalysisMetadata


# ============================================================
# Cycle Analysis Schemas
# ============================================================

class PhasePattern(BaseModel):
    """Pattern for a specific cycle phase."""
    days: List[int]
    avg_symptoms: Dict[str, float]
    worst_triggers: List[str]
    best_foods: List[str]
    recommendation: str


class NextWeekPrediction(BaseModel):
    """Prediction for next week based on cycle."""
    expected_phase: CyclePhase
    phase_start_date: date
    foods_to_avoid: List[str]
    foods_to_prioritize: List[str]


class CycleAnalysisMetadata(BaseModel):
    """Metadata for cycle analysis."""
    cycles_analyzed: int
    data_quality: str
    confidence: ConfidenceLevel


class CycleAnalysisResponse(BaseModel):
    """Cycle analysis response."""
    cycle_enabled: bool
    current_phase: Optional[CyclePhase] = None
    current_cycle_day: Optional[int] = None
    phase_patterns: Dict[str, PhasePattern]
    prediction_for_next_week: Optional[NextWeekPrediction] = None
    analysis_metadata: CycleAnalysisMetadata
```

---

## 6. Error Handling Patterns

### 6.1 Standard Error Response Format

All API errors follow a consistent structure:

```json
{
  "error": {
    "code": "ERROR_CODE",
    "message": "Human-readable error message",
    "details": [
      {
        "field": "field_name",
        "message": "Specific field error",
        "code": "FIELD_ERROR_CODE"
      }
    ],
    "request_id": "req_abc123",
    "timestamp": "2026-01-20T12:30:00Z",
    "documentation_url": "https://docs.aurea.app/errors/ERROR_CODE"
  }
}
```

### 6.2 Error Code Catalog

| HTTP Status | Error Code | Description |
|-------------|------------|-------------|
| 400 | `VALIDATION_ERROR` | Request validation failed |
| 400 | `QUERY_TOO_SHORT` | Search query must be at least 2 characters |
| 400 | `INVALID_DATE_RANGE` | Date range is invalid |
| 400 | `INVALID_CYCLE_PHASE` | Invalid cycle phase value |
| 401 | `UNAUTHORIZED` | Missing or invalid authentication |
| 401 | `TOKEN_EXPIRED` | JWT token has expired |
| 401 | `TOKEN_INVALID` | JWT token is malformed |
| 403 | `FORBIDDEN` | User not authorized for this resource |
| 404 | `INGREDIENT_NOT_FOUND` | Ingredient not found in database |
| 404 | `LOG_NOT_FOUND` | Log entry not found |
| 404 | `USER_NOT_FOUND` | User not found |
| 409 | `EMAIL_ALREADY_EXISTS` | Email is already registered |
| 409 | `LOG_ALREADY_EXISTS` | Log for this date already exists |
| 422 | `INSUFFICIENT_DATA` | Not enough data for analysis |
| 422 | `CYCLE_TRACKING_DISABLED` | Cycle tracking is not enabled |
| 429 | `RATE_LIMIT_EXCEEDED` | Too many requests |
| 500 | `INTERNAL_ERROR` | Unexpected server error |
| 502 | `EXTERNAL_API_ERROR` | External API (USDA, OpenFoodFacts) unavailable |
| 503 | `SERVICE_UNAVAILABLE` | Service temporarily unavailable |

### 6.3 Validation Error Details

For validation errors, include field-level details:

```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Request validation failed",
    "details": [
      {
        "field": "ingredients",
        "message": "At least one ingredient is required",
        "code": "REQUIRED"
      },
      {
        "field": "symptoms.energy",
        "message": "Value must be between 0 and 5",
        "code": "OUT_OF_RANGE"
      },
      {
        "field": "cycle_phase",
        "message": "Must be one of: menstruation, follicular, ovulation, luteal",
        "code": "INVALID_ENUM"
      }
    ]
  }
}
```

### 6.4 Error Handling Implementation

```python
# exceptions.py

from fastapi import HTTPException, Request
from fastapi.responses import JSONResponse
from pydantic import ValidationError
import traceback
import uuid
from datetime import datetime


class AureaException(Exception):
    """Base exception for Aurea API."""

    def __init__(
        self,
        status_code: int,
        code: str,
        message: str,
        details: list = None
    ):
        self.status_code = status_code
        self.code = code
        self.message = message
        self.details = details or []


class ValidationException(AureaException):
    """Validation error exception."""

    def __init__(self, details: list):
        super().__init__(
            status_code=400,
            code="VALIDATION_ERROR",
            message="Request validation failed",
            details=details
        )


class NotFoundException(AureaException):
    """Resource not found exception."""

    def __init__(self, resource: str, identifier: str):
        super().__init__(
            status_code=404,
            code=f"{resource.upper()}_NOT_FOUND",
            message=f"{resource.capitalize()} '{identifier}' not found"
        )


class InsufficientDataException(AureaException):
    """Not enough data for analysis."""

    def __init__(self, required: int, actual: int):
        super().__init__(
            status_code=422,
            code="INSUFFICIENT_DATA",
            message=f"At least {required} data points required, but only {actual} available"
        )


async def aurea_exception_handler(request: Request, exc: AureaException):
    """Handle Aurea custom exceptions."""
    return JSONResponse(
        status_code=exc.status_code,
        content={
            "error": {
                "code": exc.code,
                "message": exc.message,
                "details": exc.details,
                "request_id": str(uuid.uuid4()),
                "timestamp": datetime.utcnow().isoformat() + "Z",
                "documentation_url": f"https://docs.aurea.app/errors/{exc.code}"
            }
        }
    )


async def validation_exception_handler(request: Request, exc: ValidationError):
    """Handle Pydantic validation errors."""
    details = []
    for error in exc.errors():
        details.append({
            "field": ".".join(str(loc) for loc in error["loc"]),
            "message": error["msg"],
            "code": error["type"].upper()
        })

    return JSONResponse(
        status_code=400,
        content={
            "error": {
                "code": "VALIDATION_ERROR",
                "message": "Request validation failed",
                "details": details,
                "request_id": str(uuid.uuid4()),
                "timestamp": datetime.utcnow().isoformat() + "Z"
            }
        }
    )
```

---

## 7. Rate Limiting Strategy

### 7.1 Rate Limit Tiers

| Tier | Requests/Minute | Requests/Hour | Requests/Day | Target Users |
|------|-----------------|---------------|--------------|--------------|
| Anonymous | 10 | 100 | 500 | Unauthenticated |
| Free | 30 | 500 | 5,000 | Registered users |
| Premium | 100 | 2,000 | 20,000 | Paid subscribers |
| API Partner | 500 | 10,000 | 100,000 | Integrations |

### 7.2 Endpoint-Specific Limits

Some endpoints have additional specific limits:

| Endpoint | Additional Limit | Reason |
|----------|------------------|--------|
| `POST /predictions` | 20/hour | Computationally expensive |
| `GET /insights` | 10/hour | Heavy analysis |
| `GET /insights/triggers` | 10/hour | Heavy analysis |
| `GET /insights/cycles` | 10/hour | Heavy analysis |
| `/ingredients/autocomplete` | 60/minute | High-frequency typing |
| `POST /auth/login` | 5/minute | Brute force protection |
| `POST /auth/signup` | 3/minute | Spam protection |

### 7.3 Rate Limit Headers

All responses include rate limit information:

```http
HTTP/1.1 200 OK
X-RateLimit-Limit: 30
X-RateLimit-Remaining: 25
X-RateLimit-Reset: 1705754400
X-RateLimit-Policy: 30;w=60
```

### 7.4 Rate Limit Exceeded Response

```json
{
  "error": {
    "code": "RATE_LIMIT_EXCEEDED",
    "message": "Too many requests. Please wait before retrying.",
    "details": [
      {
        "limit": 30,
        "window_seconds": 60,
        "retry_after_seconds": 45
      }
    ],
    "retry_after": 45
  }
}
```

**HTTP Headers:**
```http
HTTP/1.1 429 Too Many Requests
Retry-After: 45
X-RateLimit-Limit: 30
X-RateLimit-Remaining: 0
X-RateLimit-Reset: 1705754445
```

### 7.5 Implementation with slowapi

```python
# rate_limiting.py

from slowapi import Limiter, _rate_limit_exceeded_handler
from slowapi.util import get_remote_address
from slowapi.errors import RateLimitExceeded
from fastapi import Request


def get_user_identifier(request: Request) -> str:
    """Get rate limit key - user ID if authenticated, IP otherwise."""
    # Check for authenticated user
    if hasattr(request.state, 'user') and request.state.user:
        return f"user:{request.state.user.id}"

    # Fall back to IP address
    return f"ip:{get_remote_address(request)}"


limiter = Limiter(
    key_func=get_user_identifier,
    default_limits=["30/minute", "500/hour"],
    storage_uri="redis://localhost:6379",
    strategy="fixed-window"
)


# Usage in routes
@router.get("/ingredients/autocomplete")
@limiter.limit("60/minute")
async def autocomplete(request: Request, q: str):
    ...


@router.post("/predictions")
@limiter.limit("20/hour")
async def create_prediction(request: Request, data: PredictionCreate):
    ...


@router.post("/auth/login")
@limiter.limit("5/minute")
async def login(request: Request, credentials: UserLogin):
    ...
```

---

## 8. Authentication Flow Details

### 8.1 Authentication Architecture

Aurea uses JWT (JSON Web Tokens) with the following characteristics:

| Property | Value |
|----------|-------|
| Algorithm | HS256 |
| Access Token TTL | 24 hours |
| Refresh Token TTL | 30 days |
| Token Location | Authorization header (Bearer) |
| Token Storage (Client) | localStorage (web), SecureStorage (mobile) |

### 8.2 Token Structure

**Access Token Payload:**
```json
{
  "sub": "550e8400-e29b-41d4-a716-446655440000",
  "email": "user@example.com",
  "type": "access",
  "iat": 1705708800,
  "exp": 1705795200
}
```

**Refresh Token Payload:**
```json
{
  "sub": "550e8400-e29b-41d4-a716-446655440000",
  "type": "refresh",
  "jti": "unique-token-id",
  "iat": 1705708800,
  "exp": 1708300800
}
```

### 8.3 Authentication Flows

#### 8.3.1 Sign Up Flow

```
Client                              Server
  |                                    |
  |  POST /auth/signup                 |
  |  {email, password}                 |
  |----------------------------------->|
  |                                    |
  |  Validate email format             |
  |  Check email uniqueness            |
  |  Hash password (bcrypt)            |
  |  Create user record                |
  |  Generate tokens                   |
  |                                    |
  |  201 Created                       |
  |  {user_id, email, token,           |
  |   refresh_token}                   |
  |<-----------------------------------|
  |                                    |
  |  Store tokens locally              |
```

#### 8.3.2 Login Flow

```
Client                              Server
  |                                    |
  |  POST /auth/login                  |
  |  {email, password}                 |
  |----------------------------------->|
  |                                    |
  |  Find user by email                |
  |  Verify password                   |
  |  Generate tokens                   |
  |                                    |
  |  200 OK                            |
  |  {user_id, email, token,           |
  |   refresh_token}                   |
  |<-----------------------------------|
  |                                    |
  |  Store tokens locally              |
```

#### 8.3.3 Token Refresh Flow

```
Client                              Server
  |                                    |
  |  Access token expired              |
  |                                    |
  |  POST /auth/refresh                |
  |  {refresh_token}                   |
  |----------------------------------->|
  |                                    |
  |  Validate refresh token            |
  |  Check token not revoked           |
  |  Generate new access token         |
  |                                    |
  |  200 OK                            |
  |  {token, refresh_token}            |
  |<-----------------------------------|
  |                                    |
  |  Update stored tokens              |
```

#### 8.3.4 Logout Flow

```
Client                              Server
  |                                    |
  |  POST /auth/logout                 |
  |  Authorization: Bearer <token>     |
  |----------------------------------->|
  |                                    |
  |  Add refresh token to blocklist    |
  |  (Optional: add access token)      |
  |                                    |
  |  204 No Content                    |
  |<-----------------------------------|
  |                                    |
  |  Clear stored tokens               |
```

### 8.4 Enhanced Auth Endpoints

#### 8.4.1 Token Refresh

**Endpoint:** `POST /auth/refresh`

**Request:**
```json
{
  "refresh_token": "eyJhbGciOiJIUzI1NiIs..."
}
```

**Response (200 OK):**
```json
{
  "token": "eyJhbGciOiJIUzI1NiIs...",
  "refresh_token": "eyJhbGciOiJIUzI1NiIs...",
  "expires_in": 86400
}
```

**Error Responses:**
- `401 TOKEN_EXPIRED` - Refresh token has expired
- `401 TOKEN_INVALID` - Refresh token is malformed
- `401 TOKEN_REVOKED` - Refresh token has been revoked

#### 8.4.2 Logout

**Endpoint:** `POST /auth/logout`

**Request:**
```http
POST /auth/logout
Authorization: Bearer <access_token>
```

**Response (204 No Content):** Empty body

### 8.5 Security Middleware

```python
# security.py enhancements

from fastapi import Depends, HTTPException, status
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
import jwt
from datetime import datetime
from typing import Optional


security = HTTPBearer()


async def get_current_user(
    credentials: HTTPAuthorizationCredentials = Depends(security),
    db: Session = Depends(get_db)
) -> User:
    """Validate JWT and return current user."""
    token = credentials.credentials

    try:
        payload = jwt.decode(
            token,
            settings.JWT_SECRET,
            algorithms=["HS256"]
        )
    except jwt.ExpiredSignatureError:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail={"code": "TOKEN_EXPIRED", "message": "Token has expired"}
        )
    except jwt.InvalidTokenError:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail={"code": "TOKEN_INVALID", "message": "Invalid token"}
        )

    # Check token type
    if payload.get("type") != "access":
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail={"code": "TOKEN_INVALID", "message": "Invalid token type"}
        )

    # Get user
    user_id = payload.get("sub")
    user = db.query(User).filter(User.id == user_id).first()

    if not user:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail={"code": "USER_NOT_FOUND", "message": "User not found"}
        )

    return user


async def get_current_user_optional(
    credentials: Optional[HTTPAuthorizationCredentials] = Depends(
        HTTPBearer(auto_error=False)
    ),
    db: Session = Depends(get_db)
) -> Optional[User]:
    """Get current user if authenticated, None otherwise."""
    if not credentials:
        return None

    try:
        return await get_current_user(credentials, db)
    except HTTPException:
        return None
```

### 8.6 Enhanced Auth Responses

**Sign Up Response (Enhanced):**
```json
{
  "data": {
    "user_id": "550e8400-e29b-41d4-a716-446655440000",
    "email": "user@example.com",
    "created_at": "2026-01-20T12:30:00Z"
  },
  "auth": {
    "token": "eyJhbGciOiJIUzI1NiIs...",
    "refresh_token": "eyJhbGciOiJIUzI1NiIs...",
    "token_type": "Bearer",
    "expires_in": 86400
  }
}
```

**Login Response (Enhanced):**
```json
{
  "data": {
    "user_id": "550e8400-e29b-41d4-a716-446655440000",
    "email": "user@example.com",
    "profile": {
      "display_name": "Jane",
      "cycle_tracking_enabled": true
    },
    "stats": {
      "total_logs": 45,
      "streak_days": 7
    }
  },
  "auth": {
    "token": "eyJhbGciOiJIUzI1NiIs...",
    "refresh_token": "eyJhbGciOiJIUzI1NiIs...",
    "token_type": "Bearer",
    "expires_in": 86400
  }
}
```

---

## 9. OpenAPI Specification

### 9.1 OpenAPI Document (Partial)

```yaml
openapi: 3.1.0
info:
  title: Aurea API
  description: Personal Ingredient & Symptom Predictor Platform API
  version: 2.0.0
  contact:
    name: Aurea Support
    email: api@aurea.app
  license:
    name: Proprietary

servers:
  - url: https://api.aurea.app/v2
    description: Production
  - url: https://staging-api.aurea.app/v2
    description: Staging
  - url: http://localhost:8000
    description: Development

tags:
  - name: Auth
    description: Authentication and authorization
  - name: Users
    description: User profile management
  - name: Ingredients
    description: Ingredient search and scoring
  - name: Logs
    description: Daily food and symptom logging
  - name: Predictions
    description: Symptom predictions
  - name: Insights
    description: Personalized health insights
  - name: Health
    description: Service health checks

components:
  securitySchemes:
    BearerAuth:
      type: http
      scheme: bearer
      bearerFormat: JWT
      description: JWT token obtained from /auth/login

  schemas:
    Error:
      type: object
      required:
        - error
      properties:
        error:
          type: object
          required:
            - code
            - message
          properties:
            code:
              type: string
              example: VALIDATION_ERROR
            message:
              type: string
              example: Request validation failed
            details:
              type: array
              items:
                type: object
                properties:
                  field:
                    type: string
                  message:
                    type: string
                  code:
                    type: string
            request_id:
              type: string
              format: uuid
            timestamp:
              type: string
              format: date-time
            documentation_url:
              type: string
              format: uri

    CyclePhase:
      type: string
      enum:
        - menstruation
        - follicular
        - ovulation
        - luteal

    ConfidenceLevel:
      type: string
      enum:
        - high
        - medium
        - low

    RiskLevel:
      type: string
      enum:
        - low
        - moderate
        - high

    AutocompleteItem:
      type: object
      required:
        - name
        - display_name
        - match_score
      properties:
        name:
          type: string
          example: broccoli
        display_name:
          type: string
          example: Broccoli
        match_score:
          type: number
          format: float
          minimum: 0
          maximum: 1
          example: 0.95
        category:
          type: string
          example: vegetable
        scores:
          type: object
          properties:
            overall_score:
              type: integer
              minimum: 0
              maximum: 100
            blood_sugar_impact:
              type: integer
              minimum: 0
              maximum: 100
            inflammation_potential:
              type: integer
              minimum: 0
              maximum: 100
            gut_impact:
              type: integer
              minimum: 0
              maximum: 100

    ConfidenceInterval:
      type: object
      required:
        - lower
        - upper
      properties:
        lower:
          type: number
          format: float
          minimum: 0
          maximum: 1
        upper:
          type: number
          format: float
          minimum: 0
          maximum: 1

    SymptomPrediction:
      type: object
      required:
        - probability
        - confidence_interval
        - severity_prediction
      properties:
        probability:
          type: number
          format: float
          minimum: 0
          maximum: 1
        confidence_interval:
          $ref: '#/components/schemas/ConfidenceInterval'
        severity_prediction:
          type: string
          enum:
            - mild
            - moderate
            - severe
        direction:
          type: string
          enum:
            - increase
            - decrease
        peak_time_hours:
          type: integer

    UserProfile:
      type: object
      properties:
        display_name:
          type: string
          maxLength: 100
        timezone:
          type: string
          example: America/New_York
        cycle_tracking_enabled:
          type: boolean
          default: false
        cycle_length_days:
          type: integer
          minimum: 21
          maximum: 35
          default: 28
        last_period_start:
          type: string
          format: date

paths:
  /ingredients/autocomplete:
    get:
      tags:
        - Ingredients
      summary: Autocomplete ingredient search
      description: Returns ingredient suggestions with fuzzy matching
      operationId: autocompleteIngredients
      parameters:
        - name: q
          in: query
          required: true
          schema:
            type: string
            minLength: 2
          description: Search query (minimum 2 characters)
        - name: limit
          in: query
          required: false
          schema:
            type: integer
            minimum: 1
            maximum: 50
            default: 10
          description: Maximum number of results
        - name: include_scores
          in: query
          required: false
          schema:
            type: boolean
            default: false
          description: Include health scores in results
      responses:
        '200':
          description: Successful autocomplete results
          content:
            application/json:
              schema:
                type: object
                properties:
                  data:
                    type: array
                    items:
                      $ref: '#/components/schemas/AutocompleteItem'
                  meta:
                    type: object
                    properties:
                      query:
                        type: string
                      total_matches:
                        type: integer
                      search_time_ms:
                        type: integer
        '400':
          description: Query too short
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Error'
        '429':
          description: Rate limit exceeded
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Error'

  /predictions:
    post:
      tags:
        - Predictions
      summary: Create symptom prediction
      description: Predicts symptoms based on ingredients and optional cycle phase
      operationId: createPrediction
      security:
        - BearerAuth: []
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              required:
                - ingredients
              properties:
                ingredients:
                  type: array
                  items:
                    type: string
                  minItems: 1
                  example: ["dairy", "wheat", "sugar"]
                cycle_phase:
                  $ref: '#/components/schemas/CyclePhase'
                meal_type:
                  type: string
                  enum:
                    - breakfast
                    - lunch
                    - dinner
                    - snack
                include_confidence_intervals:
                  type: boolean
                  default: true
                include_contributing_factors:
                  type: boolean
                  default: true
      responses:
        '200':
          description: Prediction created successfully
          content:
            application/json:
              schema:
                type: object
                properties:
                  data:
                    type: object
                    properties:
                      id:
                        type: string
                        format: uuid
                      predicted_date:
                        type: string
                        format: date
                      ingredients:
                        type: array
                        items:
                          type: string
                      predictions:
                        type: object
                        additionalProperties:
                          $ref: '#/components/schemas/SymptomPrediction'
                      overall_risk_level:
                        $ref: '#/components/schemas/RiskLevel'
                      interpretation:
                        type: string
                      created_at:
                        type: string
                        format: date-time
        '401':
          description: Unauthorized
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Error'
        '422':
          description: Insufficient data for prediction
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Error'

  /users/me:
    get:
      tags:
        - Users
      summary: Get current user profile
      description: Returns the authenticated user's profile and statistics
      operationId: getCurrentUser
      security:
        - BearerAuth: []
      responses:
        '200':
          description: User profile retrieved successfully
          content:
            application/json:
              schema:
                type: object
                properties:
                  data:
                    type: object
                    properties:
                      id:
                        type: string
                        format: uuid
                      email:
                        type: string
                        format: email
                      created_at:
                        type: string
                        format: date-time
                      profile:
                        $ref: '#/components/schemas/UserProfile'
                      stats:
                        type: object
                        properties:
                          total_logs:
                            type: integer
                          streak_days:
                            type: integer
                          data_quality_score:
                            type: number
                            format: float
                          predictions_accuracy:
                            type: number
                            format: float
        '401':
          description: Unauthorized
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Error'
    put:
      tags:
        - Users
      summary: Update current user profile
      description: Updates the authenticated user's profile
      operationId: updateCurrentUser
      security:
        - BearerAuth: []
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/UserProfile'
      responses:
        '200':
          description: Profile updated successfully
        '400':
          description: Validation error
        '401':
          description: Unauthorized
```

---

## 10. Migration Guide

### 10.1 API Version Migration (v1 to v2)

#### Breaking Changes

| Change | v1 Behavior | v2 Behavior | Migration |
|--------|-------------|-------------|-----------|
| Response wrapper | Direct data | `{data: {...}}` | Update response parsing |
| Error format | `{detail: string}` | `{error: {...}}` | Update error handling |
| Pagination | Array response | `{data: [], meta: {}}` | Update list handling |
| Predictions | Basic probability | Full breakdown | Handle new fields |

#### Non-Breaking Additions

- New fields are additive and optional to consume
- New endpoints don't affect existing functionality
- Enhanced responses maintain backward compatibility

### 10.2 Database Schema Changes

```sql
-- Add user profile fields
ALTER TABLE users ADD COLUMN display_name VARCHAR(100);
ALTER TABLE users ADD COLUMN timezone VARCHAR(50) DEFAULT 'UTC';
ALTER TABLE users ADD COLUMN cycle_tracking_enabled BOOLEAN DEFAULT FALSE;
ALTER TABLE users ADD COLUMN cycle_length_days INTEGER DEFAULT 28;
ALTER TABLE users ADD COLUMN last_period_start DATE;
ALTER TABLE users ADD COLUMN preferences JSONB DEFAULT '{}';

-- Add ingredient metadata
ALTER TABLE ingredient_scores ADD COLUMN category VARCHAR(50);
ALTER TABLE ingredient_scores ADD COLUMN aliases JSONB DEFAULT '[]';
ALTER TABLE ingredient_scores ADD COLUMN common_in JSONB DEFAULT '[]';
ALTER TABLE ingredient_scores ADD COLUMN warnings JSONB DEFAULT '[]';

-- Add prediction confidence fields
ALTER TABLE predictions ADD COLUMN confidence_lower FLOAT;
ALTER TABLE predictions ADD COLUMN confidence_upper FLOAT;
ALTER TABLE predictions ADD COLUMN contributing_factors JSONB;
ALTER TABLE predictions ADD COLUMN risk_level VARCHAR(20);

-- Add log meal type
ALTER TABLE user_logs ADD COLUMN meal_type VARCHAR(20);

-- Create indexes for search
CREATE INDEX idx_ingredient_name_trgm ON ingredient_scores
USING gin (ingredient_name gin_trgm_ops);

CREATE INDEX idx_ingredient_category ON ingredient_scores (category);
```

### 10.3 Implementation Priority

| Phase | Endpoints | Effort | Dependencies |
|-------|-----------|--------|--------------|
| 1 | User profile CRUD | Low | Database migration |
| 1 | Ingredient autocomplete | Medium | Fuzzy matching library |
| 2 | Enhanced predictions | High | ML model updates |
| 2 | Insights triggers | Medium | Correlation analysis |
| 3 | Cycle analysis | Medium | Cycle tracking |
| 3 | Lag analysis | High | Time series analysis |
| 4 | Auth refresh/logout | Low | Token management |

### 10.4 Testing Checklist

- [ ] All new endpoints return correct status codes
- [ ] Error responses follow standard format
- [ ] Rate limiting headers present
- [ ] Authentication required where specified
- [ ] Pagination works correctly
- [ ] Fuzzy matching returns relevant results
- [ ] Confidence intervals are mathematically valid
- [ ] Cycle analysis respects cycle_tracking_enabled
- [ ] Database migrations run without data loss

---

## Appendix A: Complete Endpoint Summary

| Method | Endpoint | Auth | Rate Limit | Status |
|--------|----------|------|------------|--------|
| GET | `/health` | No | 100/min | Existing |
| POST | `/auth/signup` | No | 3/min | Enhanced |
| POST | `/auth/login` | No | 5/min | Enhanced |
| POST | `/auth/refresh` | No | 10/min | **New** |
| POST | `/auth/logout` | Yes | 10/min | **New** |
| GET | `/users/me` | Yes | 30/min | **New** |
| PUT | `/users/me` | Yes | 10/min | **New** |
| GET | `/users/me/preferences` | Yes | 30/min | **New** |
| PUT | `/users/me/preferences` | Yes | 10/min | **New** |
| GET | `/ingredients/autocomplete` | No | 60/min | **New** |
| GET | `/ingredients/search` | No | 30/min | **New** |
| GET | `/ingredient/{name}` | No | 30/min | Existing |
| POST | `/logs` | Yes | 30/min | Enhanced |
| GET | `/logs` | Yes | 30/min | Enhanced |
| GET | `/logs/{date}` | Yes | 30/min | Existing |
| DELETE | `/logs/{id}` | Yes | 10/min | Existing |
| GET | `/predictions` | Yes | 30/min | Enhanced |
| POST | `/predictions` | Yes | 20/hour | Enhanced |
| GET | `/insights` | Yes | 10/hour | Enhanced |
| GET | `/insights/triggers` | Yes | 10/hour | **New** |
| GET | `/insights/cycles` | Yes | 10/hour | **New** |

---

## Appendix B: Response Time SLOs

| Endpoint Category | P50 | P95 | P99 |
|-------------------|-----|-----|-----|
| Health Check | 10ms | 50ms | 100ms |
| Auth | 100ms | 300ms | 500ms |
| Autocomplete | 50ms | 150ms | 300ms |
| Simple CRUD | 100ms | 300ms | 500ms |
| Predictions | 500ms | 1500ms | 3000ms |
| Insights | 1000ms | 3000ms | 5000ms |

---

**Document Version:** 2.0.0
**Last Updated:** January 20, 2026
**Next Review:** February 20, 2026
