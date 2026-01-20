"""
API Routes for Aurea Backend.

All endpoints are defined here and organized by feature area:
- Auth: /auth/signup, /auth/login
- Ingredients: /ingredient/{name}
- Logs: /logs (CRUD)
- Predictions: /predictions
- Insights: /insights
- Health: /health
"""

from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from typing import List
from datetime import date
import uuid

from app.core.database import get_db
from app.core.security import (
    hash_password,
    verify_password,
    create_access_token,
    get_current_user
)
from app.models.database import User, UserLog, IngredientScore, Prediction
from app.api.schemas import (
    UserCreate, UserLogin, AuthResponse, UserResponse,
    IngredientScoreResponse,
    LogCreate, LogResponse, LogListResponse,
    PredictionCreate, PredictionResponse, PredictionListResponse,
    InsightsResponse, TriggerInfo,
    HealthResponse
)
from app.services.ingredient_scorer import IngredientScorer
from app.services.ml_predictor import PersonalPredictorModel
from app.services.analysis_engine import InsightEngine
from app.core.config import settings

# Create router
router = APIRouter()


# ============================================================
# Health Check
# ============================================================

@router.get("/health", response_model=HealthResponse, tags=["Health"])
async def health_check():
    """
    Health check endpoint.
    Returns OK if the service is running.
    """
    return HealthResponse(
        status="ok",
        version="1.0.0",
        environment=settings.ENVIRONMENT
    )


# ============================================================
# Auth Endpoints
# ============================================================

@router.post("/auth/signup", response_model=AuthResponse, tags=["Auth"])
async def signup(user_data: UserCreate, db: Session = Depends(get_db)):
    """
    Register a new user.

    - Creates new user account
    - Returns JWT token for immediate login
    """
    # Check if email already exists
    existing_user = db.query(User).filter(User.email == user_data.email).first()
    if existing_user:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Email already registered"
        )

    # Create new user
    user = User(
        email=user_data.email,
        password_hash=hash_password(user_data.password)
    )
    db.add(user)
    db.commit()
    db.refresh(user)

    # Generate token
    token = create_access_token({"sub": str(user.id), "email": user.email})

    return AuthResponse(
        user_id=user.id,
        email=user.email,
        token=token
    )


@router.post("/auth/login", response_model=AuthResponse, tags=["Auth"])
async def login(credentials: UserLogin, db: Session = Depends(get_db)):
    """
    Login with email and password.

    - Validates credentials
    - Returns JWT token
    """
    # Find user
    user = db.query(User).filter(User.email == credentials.email).first()
    if not user:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid email or password"
        )

    # Verify password
    if not verify_password(credentials.password, user.password_hash):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid email or password"
        )

    # Generate token
    token = create_access_token({"sub": str(user.id), "email": user.email})

    return AuthResponse(
        user_id=user.id,
        email=user.email,
        token=token
    )


# ============================================================
# Ingredient Endpoints
# ============================================================

@router.get("/ingredient/{name}", response_model=IngredientScoreResponse, tags=["Ingredients"])
async def get_ingredient_score(name: str, db: Session = Depends(get_db)):
    """
    Get health scores for an ingredient.

    - Checks cache first
    - If not cached, calls scoring service
    - Returns health impact scores

    Note: Scoring service is a stub - implement in services/ingredient_scorer.py
    """
    # Normalize ingredient name
    normalized_name = name.lower().strip()

    # Check cache
    cached = db.query(IngredientScore).filter(
        IngredientScore.ingredient_name == normalized_name
    ).first()

    if cached:
        return IngredientScoreResponse(
            name=cached.ingredient_name,
            blood_sugar_impact=cached.blood_sugar_impact,
            inflammation_potential=cached.inflammation_potential,
            gut_impact=cached.gut_impact,
            overall_score=cached.overall_score,
            hormonal_relevance=cached.hormonal_relevance,
            evidence_confidence=cached.evidence_confidence,
            sources=cached.sources
        )

    # Not cached - call scoring service
    scorer = IngredientScorer()
    scores = await scorer.score_ingredient(normalized_name)

    if scores is None:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Ingredient '{name}' not found"
        )

    # Cache the result
    cached_score = IngredientScore(
        ingredient_name=normalized_name,
        blood_sugar_impact=scores.blood_sugar_impact,
        inflammation_potential=scores.inflammation_potential,
        gut_impact=scores.gut_impact,
        overall_score=scores.overall_score,
        hormonal_relevance=scores.hormonal_relevance,
        evidence_confidence=scores.evidence_confidence,
        sources=scores.sources
    )
    db.add(cached_score)
    db.commit()

    return IngredientScoreResponse(
        name=normalized_name,
        blood_sugar_impact=scores.blood_sugar_impact,
        inflammation_potential=scores.inflammation_potential,
        gut_impact=scores.gut_impact,
        overall_score=scores.overall_score,
        hormonal_relevance=scores.hormonal_relevance,
        evidence_confidence=scores.evidence_confidence,
        sources=scores.sources
    )


# ============================================================
# Log Endpoints
# ============================================================

@router.post("/logs", response_model=LogResponse, tags=["Logs"])
async def create_log(
    log_data: LogCreate,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """
    Create a daily log entry.

    - Records ingredients eaten
    - Records symptom ratings
    - Optional cycle phase tracking
    """
    log_date = log_data.date or date.today()

    # Check if log already exists for this date
    existing = db.query(UserLog).filter(
        UserLog.user_id == current_user.id,
        UserLog.date == log_date
    ).first()

    if existing:
        # Update existing log
        existing.ingredients = log_data.ingredients
        existing.symptoms = log_data.symptoms.model_dump()
        existing.cycle_phase = log_data.cycle_phase
        db.commit()
        db.refresh(existing)
        return LogResponse(
            id=existing.id,
            date=existing.date,
            ingredients=existing.ingredients,
            symptoms=existing.symptoms,
            cycle_phase=existing.cycle_phase,
            created_at=existing.created_at
        )

    # Create new log
    log = UserLog(
        user_id=current_user.id,
        date=log_date,
        ingredients=log_data.ingredients,
        symptoms=log_data.symptoms.model_dump(),
        cycle_phase=log_data.cycle_phase
    )
    db.add(log)
    db.commit()
    db.refresh(log)

    return LogResponse(
        id=log.id,
        date=log.date,
        ingredients=log.ingredients,
        symptoms=log.symptoms,
        cycle_phase=log.cycle_phase,
        created_at=log.created_at
    )


@router.get("/logs", response_model=List[LogResponse], tags=["Logs"])
async def get_logs(
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """
    Get all logs for the current user.

    Returns logs sorted by date (newest first).
    """
    logs = db.query(UserLog).filter(
        UserLog.user_id == current_user.id
    ).order_by(UserLog.date.desc()).all()

    return [
        LogResponse(
            id=log.id,
            date=log.date,
            ingredients=log.ingredients,
            symptoms=log.symptoms,
            cycle_phase=log.cycle_phase,
            created_at=log.created_at
        )
        for log in logs
    ]


@router.get("/logs/{log_date}", response_model=LogResponse, tags=["Logs"])
async def get_log_by_date(
    log_date: date,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """
    Get a specific log by date.
    """
    log = db.query(UserLog).filter(
        UserLog.user_id == current_user.id,
        UserLog.date == log_date
    ).first()

    if not log:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"No log found for {log_date}"
        )

    return LogResponse(
        id=log.id,
        date=log.date,
        ingredients=log.ingredients,
        symptoms=log.symptoms,
        cycle_phase=log.cycle_phase,
        created_at=log.created_at
    )


@router.delete("/logs/{log_id}", tags=["Logs"])
async def delete_log(
    log_id: uuid.UUID,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """
    Delete a log entry.
    """
    log = db.query(UserLog).filter(
        UserLog.id == log_id,
        UserLog.user_id == current_user.id
    ).first()

    if not log:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Log not found"
        )

    db.delete(log)
    db.commit()

    return {"message": "Log deleted successfully"}


# ============================================================
# Prediction Endpoints
# ============================================================

@router.get("/predictions", response_model=List[PredictionResponse], tags=["Predictions"])
async def get_predictions(
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """
    Get all predictions for the current user.

    Note: Prediction service is a stub - implement in services/ml_predictor.py
    """
    predictions = db.query(Prediction).filter(
        Prediction.user_id == current_user.id
    ).order_by(Prediction.created_at.desc()).all()

    return [
        PredictionResponse(
            id=p.id,
            predicted_date=p.predicted_date,
            ingredients=p.ingredients,
            predicted_bloating_probability=p.predicted_bloating_probability,
            predicted_symptoms=p.predicted_symptoms,
            confidence=p.confidence,
            interpretation=p.interpretation,
            created_at=p.created_at
        )
        for p in predictions
    ]


@router.post("/predictions", response_model=PredictionResponse, tags=["Predictions"])
async def create_prediction(
    prediction_data: PredictionCreate,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """
    Request a symptom prediction for given ingredients.

    Note: Prediction service is a stub - implement in services/ml_predictor.py
    """
    # Call prediction service
    predictor = PersonalPredictorModel(current_user.id)
    await predictor.train()  # Train on user's history
    result = await predictor.predict_outcome(
        prediction_data.ingredients,
        prediction_data.cycle_phase
    )

    # Save prediction
    prediction = Prediction(
        user_id=current_user.id,
        predicted_date=date.today(),
        ingredients=prediction_data.ingredients,
        cycle_phase=prediction_data.cycle_phase,
        predicted_bloating_probability=result.bloating_probability,
        predicted_symptoms=result.predicted_symptoms,
        confidence=result.confidence,
        interpretation=result.interpretation
    )
    db.add(prediction)
    db.commit()
    db.refresh(prediction)

    return PredictionResponse(
        id=prediction.id,
        predicted_date=prediction.predicted_date,
        ingredients=prediction.ingredients,
        predicted_bloating_probability=prediction.predicted_bloating_probability,
        predicted_symptoms=prediction.predicted_symptoms,
        confidence=prediction.confidence,
        interpretation=prediction.interpretation,
        created_at=prediction.created_at
    )


# ============================================================
# Insights Endpoints
# ============================================================

@router.get("/insights", response_model=InsightsResponse, tags=["Insights"])
async def get_insights(
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """
    Get personalized insights based on user's log history.

    Note: Analysis engine is a stub - implement in services/analysis_engine.py
    """
    # Call analysis engine
    engine = InsightEngine(current_user.id)
    result = await engine.generate_insights()

    return InsightsResponse(
        top_triggers=[
            TriggerInfo(
                ingredient=t.ingredient,
                correlation=t.correlation,
                affected_symptoms=t.affected_symptoms
            )
            for t in result.top_triggers
        ],
        phase_analysis=result.phase_analysis,
        lag_analysis=result.lag_analysis,
        confidence_assessment=result.confidence_assessment,
        recommendations=result.recommendations
    )
