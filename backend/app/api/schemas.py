"""
Pydantic schemas for request/response validation.
"""

from pydantic import BaseModel, EmailStr, Field
from typing import Optional, List, Dict, Any
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
# Ingredient Schemas
# ============================================================

class IngredientScoreResponse(BaseModel):
    """Schema for ingredient score response."""
    name: str
    blood_sugar_impact: Optional[int] = None
    inflammation_potential: Optional[int] = None
    gut_impact: Optional[int] = None
    overall_score: Optional[int] = None
    hormonal_relevance: Optional[Dict[str, Any]] = None
    evidence_confidence: Optional[str] = None
    sources: Optional[List[Dict[str, Any]]] = None

    class Config:
        from_attributes = True


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


class LogCreate(BaseModel):
    """Schema for creating a daily log."""
    date: Optional[date] = None  # Defaults to today if not provided
    ingredients: List[str]
    symptoms: SymptomsInput
    cycle_phase: Optional[str] = None


class LogResponse(BaseModel):
    """Schema for log response."""
    id: UUID
    date: date
    ingredients: List[str]
    symptoms: Dict[str, int]
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
# Insights Schemas
# ============================================================

class TriggerInfo(BaseModel):
    """Schema for trigger ingredient info."""
    ingredient: str
    correlation: float
    affected_symptoms: List[str]


class InsightsResponse(BaseModel):
    """Schema for user insights response."""
    top_triggers: List[TriggerInfo]
    phase_analysis: Optional[Dict[str, Any]] = None
    lag_analysis: Optional[Dict[str, Any]] = None
    confidence_assessment: Optional[str] = None
    recommendations: Optional[List[str]] = None


# ============================================================
# Health Check
# ============================================================

class HealthResponse(BaseModel):
    """Schema for health check response."""
    status: str
    version: str = "1.0.0"
    environment: str
