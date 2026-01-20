"""
SQLAlchemy database models for Aurea.

Tables:
- users: User accounts
- user_logs: Daily food/symptom entries
- ingredient_scores: Cached ingredient health scores
- predictions: ML model predictions
"""

import uuid
from datetime import datetime
from sqlalchemy import Column, String, DateTime, Date, Integer, Float, ForeignKey, func
from sqlalchemy.dialects.postgresql import UUID, JSONB
from sqlalchemy.orm import relationship

from app.core.database import Base


class User(Base):
    """User account model."""
    __tablename__ = "users"

    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    email = Column(String(255), unique=True, nullable=False, index=True)
    password_hash = Column(String(255), nullable=False)
    created_at = Column(DateTime, server_default=func.now())
    updated_at = Column(DateTime, server_default=func.now(), onupdate=func.now())

    # Relationships
    logs = relationship("UserLog", back_populates="user", cascade="all, delete-orphan")
    predictions = relationship("Prediction", back_populates="user", cascade="all, delete-orphan")

    def __repr__(self):
        return f"<User {self.email}>"


class UserLog(Base):
    """
    Daily log entry for a user.
    Contains ingredients consumed and symptom ratings.
    """
    __tablename__ = "user_logs"

    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id = Column(UUID(as_uuid=True), ForeignKey("users.id"), nullable=False, index=True)
    date = Column(Date, nullable=False, index=True)

    # Food data - list of ingredient names
    ingredients = Column(JSONB, default=list)
    # Example: ["sugar", "wheat", "dairy"]

    # Symptom ratings (0-5 scale)
    symptoms = Column(JSONB, default=dict)
    # Example: {"energy": 4, "bloating": 2, "focus": 3, "mood": 4, "sleep": 3}

    # Optional cycle phase tracking
    cycle_phase = Column(String(50), nullable=True)
    # Values: "menstruation", "follicular", "ovulation", "luteal", null

    created_at = Column(DateTime, server_default=func.now())
    updated_at = Column(DateTime, server_default=func.now(), onupdate=func.now())

    # Relationships
    user = relationship("User", back_populates="logs")

    def __repr__(self):
        return f"<UserLog {self.date} - {self.user_id}>"


class IngredientScore(Base):
    """
    Cached health scores for ingredients.
    Populated by the scoring service (to be implemented by user).
    """
    __tablename__ = "ingredient_scores"

    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    ingredient_name = Column(String(255), unique=True, nullable=False, index=True)

    # Health impact scores (0-100 scale)
    # Higher = better for most metrics, except inflammation (higher = worse)
    blood_sugar_impact = Column(Integer, nullable=True)  # 0-100
    inflammation_potential = Column(Integer, nullable=True)  # 0-100 (higher = more inflammatory)
    gut_impact = Column(Integer, nullable=True)  # 0-100
    overall_score = Column(Integer, nullable=True)  # 0-100

    # Hormonal relevance - can store detailed breakdown
    hormonal_relevance = Column(JSONB, nullable=True)
    # Example: {"score": 70, "estrogen_impact": "low", "insulin_impact": "moderate"}

    # Evidence quality
    evidence_confidence = Column(String(20), nullable=True)
    # Values: "high", "medium", "low"

    # Source citations
    sources = Column(JSONB, default=list)
    # Example: [{"name": "USDA", "url": "..."}, {"name": "PubMed", "id": "12345"}]

    cached_at = Column(DateTime, server_default=func.now())
    updated_at = Column(DateTime, server_default=func.now(), onupdate=func.now())

    def __repr__(self):
        return f"<IngredientScore {self.ingredient_name}>"


class Prediction(Base):
    """
    ML model predictions for a user.
    Stores predicted symptom outcomes based on ingredients.
    """
    __tablename__ = "predictions"

    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id = Column(UUID(as_uuid=True), ForeignKey("users.id"), nullable=False, index=True)

    # What was predicted for
    predicted_date = Column(Date, nullable=True)
    ingredients = Column(JSONB, default=list)
    cycle_phase = Column(String(50), nullable=True)

    # Prediction results
    predicted_bloating_probability = Column(Float, nullable=True)
    predicted_symptoms = Column(JSONB, nullable=True)
    # Example: {"bloating": 0.7, "low_energy": 0.4, "brain_fog": 0.3}

    confidence = Column(String(20), nullable=True)
    # Values: "high", "medium", "low"

    interpretation = Column(String(500), nullable=True)
    # Human-readable interpretation of the prediction

    created_at = Column(DateTime, server_default=func.now())

    # Relationships
    user = relationship("User", back_populates="predictions")

    def __repr__(self):
        return f"<Prediction {self.predicted_date} - {self.user_id}>"
