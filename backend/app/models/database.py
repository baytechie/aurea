"""
SQLAlchemy database models for Aurea.

Tables:
- users: User accounts with profile fields
- user_logs: Daily food/symptom entries with denormalized symptoms
- ingredient_scores: Cached ingredient health scores
- predictions: ML model predictions
- user_insights: Cached correlation insights

Supports both SQLite (development) and PostgreSQL (production).
"""

import uuid
from datetime import datetime, timezone
from sqlalchemy import (
    Column, String, DateTime, Date, Integer, Float, ForeignKey,
    func, Text, TypeDecorator, Boolean, SmallInteger, Index,
    UniqueConstraint, CheckConstraint
)
from sqlalchemy.orm import relationship
import json

from app.core.database import Base
from app.core.config import settings

# Use String for UUID in SQLite, native UUID for PostgreSQL
if settings.DATABASE_URL.startswith("sqlite"):
    from sqlalchemy import String as UUIDType
    def uuid_column(**kwargs):
        return Column(String(36), default=lambda: str(uuid.uuid4()), **kwargs)
    def uuid_fk_column(fk, **kwargs):
        return Column(String(36), ForeignKey(fk), **kwargs)
else:
    from sqlalchemy.dialects.postgresql import UUID
    def uuid_column(**kwargs):
        return Column(UUID(as_uuid=True), default=uuid.uuid4, **kwargs)
    def uuid_fk_column(fk, **kwargs):
        return Column(UUID(as_uuid=True), ForeignKey(fk), **kwargs)


def utc_now():
    """Return timezone-aware UTC datetime (Python 3.12+ compatible)."""
    return datetime.now(timezone.utc)


# Custom type for UUID that works with both SQLite and PostgreSQL
class GUID(TypeDecorator):
    """Platform-independent GUID type.
    Uses PostgreSQL's UUID type when available, otherwise stores as String(36).
    """
    impl = String(36)
    cache_ok = True

    def process_bind_param(self, value, dialect):
        if value is not None:
            return str(value)
        return value

    def process_result_value(self, value, dialect):
        if value is not None:
            return uuid.UUID(value)
        return value


# Custom type for JSON that works with both SQLite and PostgreSQL
class JSONType(TypeDecorator):
    """Platform-independent JSON type.
    Uses native JSON when available, otherwise stores as Text with JSON serialization.
    """
    impl = Text
    cache_ok = True

    def process_bind_param(self, value, dialect):
        if value is not None:
            return json.dumps(value)
        return value

    def process_result_value(self, value, dialect):
        if value is not None:
            return json.loads(value)
        return value


class User(Base):
    """User account model with profile fields."""
    __tablename__ = "users"

    id = Column(GUID(), primary_key=True, default=uuid.uuid4)
    email = Column(String(255), unique=True, nullable=False, index=True)
    password_hash = Column(String(255), nullable=False)

    # Profile fields (PRD enhancement)
    name = Column(String(100), nullable=True)
    bio = Column(Text, nullable=True)
    profile_picture_url = Column(String(500), nullable=True)
    cycle_enabled = Column(Boolean, default=False, nullable=False)

    created_at = Column(DateTime, default=utc_now)
    updated_at = Column(DateTime, default=utc_now, onupdate=utc_now)

    # Relationships
    logs = relationship("UserLog", back_populates="user", cascade="all, delete-orphan")
    predictions = relationship("Prediction", back_populates="user", cascade="all, delete-orphan")
    insights = relationship("UserInsight", back_populates="user", cascade="all, delete-orphan")

    def __repr__(self):
        return f"<User {self.email}>"


class UserLog(Base):
    """
    Daily log entry for a user.
    Contains ingredients consumed and symptom ratings.
    Symptoms are denormalized into individual columns for query performance.
    """
    __tablename__ = "user_logs"

    id = Column(GUID(), primary_key=True, default=uuid.uuid4)
    user_id = Column(GUID(), ForeignKey("users.id", ondelete="CASCADE"), nullable=False)
    date = Column(Date, nullable=False)

    # Food data - list of ingredient names
    ingredients = Column(JSONType(), default=list)
    # Example: ["sugar", "wheat", "dairy"]

    # Denormalized symptom ratings (0-5 scale)
    # Individual columns for query performance and indexing
    symptom_energy = Column(SmallInteger, nullable=True)
    symptom_bloating = Column(SmallInteger, nullable=True)
    symptom_focus = Column(SmallInteger, nullable=True)
    symptom_mood = Column(SmallInteger, nullable=True)
    symptom_sleep = Column(SmallInteger, nullable=True)

    # Legacy JSON field (deprecated - for migration compatibility)
    # Will be phased out after data migration is complete
    symptoms = Column(JSONType(), default=dict)
    # Example: {"energy": 4, "bloating": 2, "focus": 3, "mood": 4, "sleep": 3}

    # Extra symptoms for future expansion
    symptoms_extra = Column(JSONType(), default=dict)

    # Optional cycle phase tracking
    cycle_phase = Column(String(50), nullable=True)
    # Values: "menstruation", "follicular", "ovulation", "luteal", null

    created_at = Column(DateTime, default=utc_now)
    updated_at = Column(DateTime, default=utc_now, onupdate=utc_now)

    # Relationships
    user = relationship("User", back_populates="logs")

    # Table constraints and indexes
    __table_args__ = (
        Index('ix_user_logs_user_id', 'user_id'),
        Index('ix_user_logs_date', 'date'),
        Index('ix_user_logs_user_date', 'user_id', 'date'),
        UniqueConstraint('user_id', 'date', name='uq_user_logs_user_date'),
        # Check constraints for symptom values (SQLite will ignore these)
        CheckConstraint(
            'symptom_energy IS NULL OR (symptom_energy >= 0 AND symptom_energy <= 5)',
            name='ck_symptom_energy_range'
        ),
        CheckConstraint(
            'symptom_bloating IS NULL OR (symptom_bloating >= 0 AND symptom_bloating <= 5)',
            name='ck_symptom_bloating_range'
        ),
        CheckConstraint(
            'symptom_focus IS NULL OR (symptom_focus >= 0 AND symptom_focus <= 5)',
            name='ck_symptom_focus_range'
        ),
        CheckConstraint(
            'symptom_mood IS NULL OR (symptom_mood >= 0 AND symptom_mood <= 5)',
            name='ck_symptom_mood_range'
        ),
        CheckConstraint(
            'symptom_sleep IS NULL OR (symptom_sleep >= 0 AND symptom_sleep <= 5)',
            name='ck_symptom_sleep_range'
        ),
    )

    def __repr__(self):
        return f"<UserLog {self.date} - {self.user_id}>"

    @property
    def symptoms_dict(self) -> dict:
        """Return symptoms as dictionary for API compatibility."""
        return {
            'energy': self.symptom_energy,
            'bloating': self.symptom_bloating,
            'focus': self.symptom_focus,
            'mood': self.symptom_mood,
            'sleep': self.symptom_sleep,
        }

    def set_symptoms_from_dict(self, symptoms: dict):
        """Set individual symptom columns from dictionary.

        Also stores in legacy JSON field for backwards compatibility.
        """
        self.symptom_energy = symptoms.get('energy')
        self.symptom_bloating = symptoms.get('bloating')
        self.symptom_focus = symptoms.get('focus')
        self.symptom_mood = symptoms.get('mood')
        self.symptom_sleep = symptoms.get('sleep')
        # Also store in legacy field for backwards compatibility
        self.symptoms = symptoms

    def get_symptoms_with_fallback(self) -> dict:
        """Get symptoms from columns, falling back to JSON if columns are null.

        Useful during migration period when some data may still be in JSON only.
        """
        # Check if individual columns have data
        if any(v is not None for v in [
            self.symptom_energy, self.symptom_bloating,
            self.symptom_focus, self.symptom_mood, self.symptom_sleep
        ]):
            return self.symptoms_dict
        # Fall back to legacy JSON field
        return self.symptoms or {}


class IngredientScore(Base):
    """
    Cached health scores for ingredients.
    Populated by the scoring service.

    Includes comprehensive health research data with detailed descriptions
    for each health category (blood sugar, inflammation, gut, disease links, hormonal).
    """
    __tablename__ = "ingredient_scores"

    id = Column(GUID(), primary_key=True, default=uuid.uuid4)
    ingredient_name = Column(String(255), unique=True, nullable=False, index=True)

    # Category classification (e.g., "Sweeteners", "Fats & Oils")
    category = Column(String(100), nullable=True, index=True)

    # Health impact scores (0-100 scale)
    # Higher = better for most metrics, except inflammation (higher = more inflammatory)
    blood_sugar_impact = Column(Integer, nullable=True)  # 0-100
    inflammation_potential = Column(Integer, nullable=True)  # 0-100 (higher = more inflammatory)
    gut_impact = Column(Integer, nullable=True)  # 0-100
    disease_links = Column(Integer, nullable=True)  # 0-100 (higher = lower disease risk)
    overall_score = Column(Integer, nullable=True)  # 0-100

    # Detailed JSON fields for each health category
    # Each contains: score, confidence, confidence_level, description
    blood_sugar_details = Column(JSONType(), nullable=True)
    inflammation_details = Column(JSONType(), nullable=True)
    gut_impact_details = Column(JSONType(), nullable=True)
    disease_links_details = Column(JSONType(), nullable=True)

    # Hormonal relevance - can store detailed breakdown
    hormonal_relevance = Column(JSONType(), nullable=True)
    # Example: {"score": 70, "confidence": 60, "confidence_level": "mixed", "description": "..."}

    # Evidence quality (overall confidence)
    evidence_confidence = Column(String(20), nullable=True)
    # Values: "high", "medium", "low"

    # Source citations
    sources = Column(JSONType(), default=list)
    # Example: [{"url": "https://...", "type": "research"}]

    # Trust indicator (1 = fully researched, 0 = public/less trusted sources)
    is_trusted = Column(Integer, default=0)

    cached_at = Column(DateTime, default=utc_now)
    updated_at = Column(DateTime, default=utc_now, onupdate=utc_now)

    def __repr__(self):
        return f"<IngredientScore {self.ingredient_name}>"


class Prediction(Base):
    """
    ML model predictions for a user.
    Stores predicted symptom outcomes based on ingredients.
    """
    __tablename__ = "predictions"

    id = Column(GUID(), primary_key=True, default=uuid.uuid4)
    user_id = Column(GUID(), ForeignKey("users.id", ondelete="CASCADE"), nullable=False)

    # What was predicted for
    predicted_date = Column(Date, nullable=True)
    ingredients = Column(JSONType(), default=list)
    cycle_phase = Column(String(50), nullable=True)

    # Prediction results
    predicted_bloating_probability = Column(Float, nullable=True)
    predicted_symptoms = Column(JSONType(), nullable=True)
    # Example: {"bloating": 0.7, "low_energy": 0.4, "brain_fog": 0.3}

    confidence = Column(String(20), nullable=True)
    # Values: "high", "medium", "low"

    interpretation = Column(String(500), nullable=True)
    # Human-readable interpretation of the prediction

    created_at = Column(DateTime, default=utc_now)

    # Relationships
    user = relationship("User", back_populates="predictions")

    # Table indexes
    __table_args__ = (
        Index('ix_predictions_user_id', 'user_id'),
        Index('ix_predictions_user_date', 'user_id', 'predicted_date'),
    )

    def __repr__(self):
        return f"<Prediction {self.predicted_date} - {self.user_id}>"


class UserInsight(Base):
    """
    Cached user insights from correlation analysis.
    Stores pre-computed ingredient-symptom correlations and patterns.
    Updated by background analysis jobs.

    Insight Types:
    - 'trigger': Ingredient-symptom correlations (e.g., "Sugar correlates with bloating")
    - 'phase_pattern': Cycle phase symptom patterns (e.g., "Energy drops during luteal phase")
    - 'lag_effect': Delayed symptom responses (e.g., "Dairy affects bloating after 24 hours")
    - 'recommendation': Personalized dietary recommendations
    """
    __tablename__ = "user_insights"

    id = Column(GUID(), primary_key=True, default=uuid.uuid4)
    user_id = Column(GUID(), ForeignKey("users.id", ondelete="CASCADE"), nullable=False)

    # Insight classification
    insight_type = Column(String(50), nullable=False)
    # Values: 'trigger', 'phase_pattern', 'lag_effect', 'recommendation'

    # Related entities
    ingredient_name = Column(String(255), nullable=True)
    symptom_name = Column(String(50), nullable=True)

    # Statistical measures
    correlation_score = Column(Float, nullable=True)  # -1.0 to 1.0
    confidence_level = Column(String(20), nullable=True)  # 'high', 'medium', 'low'
    sample_size = Column(Integer, nullable=True)  # Number of data points analyzed
    p_value = Column(Float, nullable=True)  # Statistical significance

    # Flexible data storage for complex insights
    insight_data = Column(JSONType(), default=dict)
    # Example structures:
    # For triggers: {"avg_symptom_with": 3.5, "avg_symptom_without": 1.2, "occurrences": 15}
    # For phase_pattern: {"menstruation": {"energy_avg": 2.1}, "follicular": {"energy_avg": 3.8}}
    # For lag_effect: {"delay_hours": 24, "correlation_by_lag": {0: 0.2, 24: 0.7, 48: 0.3}}

    # Validity period
    valid_from = Column(Date, nullable=False)
    valid_until = Column(Date, nullable=False)

    # Metadata
    computed_at = Column(DateTime, default=utc_now, nullable=False)
    is_active = Column(Boolean, default=True, nullable=False)

    created_at = Column(DateTime, default=utc_now)
    updated_at = Column(DateTime, default=utc_now, onupdate=utc_now)

    # Relationships
    user = relationship("User", back_populates="insights")

    # Table constraints and indexes
    __table_args__ = (
        Index('ix_user_insights_user_id', 'user_id'),
        Index('ix_user_insights_user_type_active', 'user_id', 'insight_type', 'is_active'),
        Index('ix_user_insights_ingredient', 'ingredient_name'),
        # Check constraints (SQLite will ignore these)
        CheckConstraint(
            "insight_type IN ('trigger', 'phase_pattern', 'lag_effect', 'recommendation')",
            name='ck_insight_type_valid'
        ),
        CheckConstraint(
            "confidence_level IN ('high', 'medium', 'low') OR confidence_level IS NULL",
            name='ck_confidence_level_valid'
        ),
        CheckConstraint(
            'correlation_score IS NULL OR (correlation_score >= -1.0 AND correlation_score <= 1.0)',
            name='ck_correlation_score_range'
        ),
        CheckConstraint(
            'sample_size IS NULL OR sample_size >= 0',
            name='ck_sample_size_positive'
        ),
    )

    def __repr__(self):
        return f"<UserInsight {self.insight_type}: {self.ingredient_name} -> {self.symptom_name}>"

    @property
    def is_significant(self) -> bool:
        """Check if the insight has statistical significance (p < 0.05)."""
        return self.p_value is not None and self.p_value < 0.05

    @property
    def is_strong_correlation(self) -> bool:
        """Check if the correlation is strong (|r| > 0.5)."""
        return self.correlation_score is not None and abs(self.correlation_score) > 0.5
