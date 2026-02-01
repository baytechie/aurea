"""
Pydantic schemas for request/response validation.
"""

from pydantic import BaseModel, EmailStr, Field, field_validator, ConfigDict
from typing import Optional, List, Dict, Any, Union
from datetime import date, datetime
from uuid import UUID


# ============================================================
# Auth Schemas
# ============================================================

class UserCreate(BaseModel):
    """Schema for user registration."""
    email: EmailStr
    password: str = Field(..., min_length=8)


class UserLogin(BaseModel):
    """Schema for user login."""
    email: EmailStr
    password: str


class AuthResponse(BaseModel):
    """Schema for auth response with token."""
    user_id: UUID
    email: str
    token: str


class UserResponse(BaseModel):
    """Schema for user info response."""
    id: UUID
    email: str
    created_at: datetime

    class Config:
        from_attributes = True


# ============================================================
# User Profile Schemas
# ============================================================

class UserProfileUpdate(BaseModel):
    """Schema for updating user profile."""
    name: Optional[str] = Field(None, max_length=100)
    bio: Optional[str] = None
    profile_picture_url: Optional[str] = Field(None, max_length=500)
    cycle_enabled: Optional[bool] = None


class UserProfileResponse(BaseModel):
    """Schema for user profile response (includes profile fields)."""
    id: UUID
    email: str
    name: Optional[str] = None
    bio: Optional[str] = None
    profile_picture_url: Optional[str] = None
    cycle_enabled: bool = False
    created_at: datetime
    updated_at: Optional[datetime] = None

    class Config:
        from_attributes = True


# ============================================================
# Ingredient Schemas
# ============================================================

class HealthScoreDetail(BaseModel):
    """Schema for a single health score with confidence and description."""
    score: Optional[int] = None
    confidence: Optional[str] = None  # "high", "medium", "low"
    description: Optional[str] = None


class HealthScores(BaseModel):
    """Schema for all health category scores with details."""
    blood_sugar: Optional[HealthScoreDetail] = None
    inflammation: Optional[HealthScoreDetail] = None
    gut_impact: Optional[HealthScoreDetail] = None
    disease_links: Optional[HealthScoreDetail] = None
    hormonal: Optional[HealthScoreDetail] = None


class IngredientScoreResponse(BaseModel):
    """Schema for ingredient score response (backward compatible).

    Maintains backward compatibility with existing clients while
    supporting new fields for enhanced ingredient data.
    """
    name: str
    blood_sugar_impact: Optional[int] = None
    inflammation_potential: Optional[int] = None
    gut_impact: Optional[int] = None
    overall_score: Optional[int] = None
    hormonal_relevance: Optional[Dict[str, Any]] = None
    evidence_confidence: Optional[str] = None
    sources: Optional[List[Dict[str, Any]]] = None
    # New fields for comprehensive ingredient database
    category: Optional[str] = None
    disease_links: Optional[int] = None
    is_trusted: Optional[bool] = None

    class Config:
        from_attributes = True


class IngredientDetailedResponse(BaseModel):
    """Schema for detailed ingredient response with all health categories.

    Used by /ingredient/{name} endpoint to return comprehensive
    health information including confidence levels and descriptions.
    """
    name: str
    category: Optional[str] = None
    overall_score: Optional[int] = None
    is_trusted: bool = False
    health_scores: Optional[HealthScores] = None
    evidence_confidence: Optional[str] = None
    sources: Optional[List[Dict[str, Any]]] = None
    # Legacy fields for backward compatibility
    blood_sugar_impact: Optional[int] = None
    inflammation_potential: Optional[int] = None
    gut_impact: Optional[int] = None
    disease_links: Optional[int] = None
    hormonal_relevance: Optional[Dict[str, Any]] = None

    class Config:
        from_attributes = True


class IngredientListItem(BaseModel):
    """Schema for a single ingredient in the list endpoint."""
    name: str
    category: Optional[str] = None
    overall_score: Optional[int] = None
    is_trusted: bool = False
    blood_sugar_impact: Optional[int] = None
    inflammation_potential: Optional[int] = None
    gut_impact: Optional[int] = None
    disease_links: Optional[int] = None


class IngredientListResponse(BaseModel):
    """Schema for ingredient list response with pagination."""
    ingredients: List[IngredientListItem]
    total: int
    page: int
    page_size: int
    total_pages: int


class IngredientSearchResult(BaseModel):
    """Schema for a single ingredient search result."""
    ingredient_name: str
    match_score: float
    category: Optional[str] = None


class IngredientSearchResponse(BaseModel):
    """Schema for ingredient search response."""
    results: List[IngredientSearchResult]
    total: int


# ============================================================
# Log Schemas
# ============================================================

class SymptomsInput(BaseModel):
    """Schema for symptom ratings."""
    energy: int = Field(..., ge=0, le=5)
    bloating: int = Field(..., ge=0, le=5)
    focus: int = Field(..., ge=0, le=5)
    mood: int = Field(..., ge=0, le=5)
    sleep: int = Field(..., ge=0, le=5)


class SymptomsOutput(BaseModel):
    """Schema for symptom ratings in responses.

    Handles both new column-based symptoms and legacy JSON symptoms.
    """
    energy: Optional[int] = Field(None, ge=0, le=5)
    bloating: Optional[int] = Field(None, ge=0, le=5)
    focus: Optional[int] = Field(None, ge=0, le=5)
    mood: Optional[int] = Field(None, ge=0, le=5)
    sleep: Optional[int] = Field(None, ge=0, le=5)


class LogCreate(BaseModel):
    """Schema for creating a daily log."""
    model_config = ConfigDict(coerce_numbers_to_str=False, arbitrary_types_allowed=True)

    date: Optional[date] = None  # Defaults to today if not provided
    ingredients: List[str]
    symptoms: SymptomsInput
    cycle_phase: Optional[str] = None

    @field_validator('cycle_phase')
    @classmethod
    def validate_cycle_phase(cls, v):
        """Validate cycle phase value."""
        valid_phases = ['menstruation', 'follicular', 'ovulation', 'luteal', None]
        if v is not None and v not in valid_phases:
            raise ValueError(f"cycle_phase must be one of: {valid_phases[:-1]}")
        return v


class LogUpdate(BaseModel):
    """Schema for updating a daily log (partial update)."""
    ingredients: Optional[List[str]] = None
    symptoms: Optional[SymptomsInput] = None
    cycle_phase: Optional[str] = None

    @field_validator('cycle_phase')
    @classmethod
    def validate_cycle_phase(cls, v):
        """Validate cycle phase value."""
        valid_phases = ['menstruation', 'follicular', 'ovulation', 'luteal', None]
        if v is not None and v not in valid_phases:
            raise ValueError(f"cycle_phase must be one of: {valid_phases[:-1]}")
        return v


class LogResponse(BaseModel):
    """Schema for log response."""
    id: UUID
    date: date
    ingredients: List[str]
    symptoms: Union[SymptomsOutput, Dict[str, Optional[int]]]
    cycle_phase: Optional[str] = None
    created_at: datetime

    class Config:
        from_attributes = True


class LogListResponse(BaseModel):
    """Schema for list of logs response."""
    logs: List[LogResponse]
    total: int


# ============================================================
# Prediction Schemas
# ============================================================

class PredictionCreate(BaseModel):
    """Schema for requesting a prediction."""
    ingredients: List[str]
    cycle_phase: Optional[str] = None

    @field_validator('cycle_phase')
    @classmethod
    def validate_cycle_phase(cls, v):
        """Validate cycle phase value."""
        valid_phases = ['menstruation', 'follicular', 'ovulation', 'luteal', None]
        if v is not None and v not in valid_phases:
            raise ValueError(f"cycle_phase must be one of: {valid_phases[:-1]}")
        return v


class PredictionResponse(BaseModel):
    """Schema for prediction response."""
    id: UUID
    predicted_date: Optional[date] = None
    ingredients: List[str]
    predicted_bloating_probability: Optional[float] = None
    predicted_symptoms: Optional[Dict[str, float]] = None
    confidence: Optional[str] = None
    interpretation: Optional[str] = None
    created_at: datetime

    class Config:
        from_attributes = True


class PredictionListResponse(BaseModel):
    """Schema for list of predictions."""
    predictions: List[PredictionResponse]
    total: int


# ============================================================
# User Insights Schemas
# ============================================================

class TriggerInfo(BaseModel):
    """Schema for trigger ingredient info."""
    ingredient: str
    correlation: float
    affected_symptoms: List[str]
    confidence_level: Optional[str] = None
    sample_size: Optional[int] = None


class PhasePatternInfo(BaseModel):
    """Schema for cycle phase pattern info."""
    phase: str
    symptom: str
    average_value: float
    trend: Optional[str] = None  # 'increasing', 'decreasing', 'stable'


class LagEffectInfo(BaseModel):
    """Schema for lag effect info."""
    ingredient: str
    symptom: str
    delay_hours: int
    correlation: float


class UserInsightCreate(BaseModel):
    """Schema for creating a user insight (internal use)."""
    insight_type: str = Field(..., pattern='^(trigger|phase_pattern|lag_effect|recommendation)$')
    ingredient_name: Optional[str] = None
    symptom_name: Optional[str] = None
    correlation_score: Optional[float] = Field(None, ge=-1.0, le=1.0)
    confidence_level: Optional[str] = Field(None, pattern='^(high|medium|low)$')
    sample_size: Optional[int] = Field(None, ge=0)
    p_value: Optional[float] = None
    insight_data: Optional[Dict[str, Any]] = None
    valid_from: date
    valid_until: date


class UserInsightResponse(BaseModel):
    """Schema for user insight response."""
    id: UUID
    insight_type: str
    ingredient_name: Optional[str] = None
    symptom_name: Optional[str] = None
    correlation_score: Optional[float] = None
    confidence_level: Optional[str] = None
    sample_size: Optional[int] = None
    insight_data: Optional[Dict[str, Any]] = None
    valid_from: date
    valid_until: date
    computed_at: datetime
    is_active: bool

    class Config:
        from_attributes = True


class UserInsightListResponse(BaseModel):
    """Schema for list of user insights."""
    insights: List[UserInsightResponse]
    total: int


class InsightsResponse(BaseModel):
    """Schema for user insights response (aggregated view)."""
    top_triggers: List[TriggerInfo]
    phase_analysis: Optional[Dict[str, Any]] = None
    lag_analysis: Optional[Dict[str, Any]] = None
    confidence_assessment: Optional[str] = None
    recommendations: Optional[List[str]] = None
    # Additional fields for new insight structure
    phase_patterns: Optional[List[PhasePatternInfo]] = None
    lag_effects: Optional[List[LagEffectInfo]] = None
    data_summary: Optional[Dict[str, Any]] = None


class InsightsSummary(BaseModel):
    """Schema for a quick summary of user insights."""
    total_triggers: int
    top_trigger_ingredient: Optional[str] = None
    top_trigger_correlation: Optional[float] = None
    has_phase_patterns: bool = False
    has_lag_effects: bool = False
    last_computed_at: Optional[datetime] = None
    confidence_level: Optional[str] = None


# ============================================================
# Analytics Schemas
# ============================================================

class SymptomAggregation(BaseModel):
    """Schema for symptom aggregation data."""
    period: str  # 'day', 'week', 'month'
    date: date
    avg_energy: Optional[float] = None
    avg_bloating: Optional[float] = None
    avg_focus: Optional[float] = None
    avg_mood: Optional[float] = None
    avg_sleep: Optional[float] = None
    log_count: int


class SymptomTrendResponse(BaseModel):
    """Schema for symptom trend response."""
    aggregations: List[SymptomAggregation]
    period: str
    start_date: date
    end_date: date


# ============================================================
# Health Check
# ============================================================

class HealthResponse(BaseModel):
    """Schema for health check response."""
    status: str
    version: str = "1.0.0"
    environment: str
