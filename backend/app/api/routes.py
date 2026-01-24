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

from fastapi import APIRouter, Depends, HTTPException, status, Query
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
from app.models.database import User, UserLog, IngredientScore, Prediction, UserInsight
from app.api.schemas import (
    UserCreate, UserLogin, AuthResponse, UserResponse,
    UserProfileUpdate, UserProfileResponse,
    IngredientScoreResponse, IngredientSearchResult, IngredientSearchResponse,
    LogCreate, LogUpdate, LogResponse, LogListResponse, SymptomsOutput,
    PredictionCreate, PredictionResponse, PredictionListResponse,
    InsightsResponse, TriggerInfo,
    UserInsightResponse,
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
# User Profile Endpoints
# ============================================================

@router.get("/users/me", response_model=UserProfileResponse, tags=["Users"])
async def get_current_user_profile(
    current_user: User = Depends(get_current_user)
):
    """
    Get the current user's profile.

    Returns complete user profile including optional fields.
    """
    return UserProfileResponse(
        id=current_user.id,
        email=current_user.email,
        name=current_user.name,
        bio=current_user.bio,
        profile_picture_url=current_user.profile_picture_url,
        cycle_enabled=current_user.cycle_enabled,
        created_at=current_user.created_at,
        updated_at=current_user.updated_at
    )


@router.patch("/users/me", response_model=UserProfileResponse, tags=["Users"])
async def update_current_user_profile(
    profile_update: UserProfileUpdate,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """
    Update the current user's profile.

    - Supports partial updates
    - Only updates provided fields
    """
    # Update only the fields that were provided
    update_data = profile_update.model_dump(exclude_unset=True)
    for field, value in update_data.items():
        setattr(current_user, field, value)

    db.commit()
    db.refresh(current_user)

    return UserProfileResponse(
        id=current_user.id,
        email=current_user.email,
        name=current_user.name,
        bio=current_user.bio,
        profile_picture_url=current_user.profile_picture_url,
        cycle_enabled=current_user.cycle_enabled,
        created_at=current_user.created_at,
        updated_at=current_user.updated_at
    )


# ============================================================
# Ingredient Endpoints
# ============================================================

# NOTE: /ingredient/search MUST come before /ingredient/{name} to avoid route conflicts

@router.get("/ingredient/search", response_model=IngredientSearchResponse, tags=["Ingredients"])
async def search_ingredients(
    q: str = Query(..., min_length=2, description="Search query"),
    limit: int = Query(10, ge=1, le=50, description="Maximum number of results"),
    db: Session = Depends(get_db)
):
    """
    Search for ingredients by name (autocomplete).

    - Uses fuzzy matching (case-insensitive, partial match)
    - Checks cached ingredients in DB first
    - Falls back to static ingredient list
    - Returns match_score based on how closely the query matches
    - Results sorted by match_score descending
    """
    from app.data.common_ingredients import get_all_ingredients, get_ingredient_category

    query_lower = q.lower().strip()
    results = []

    # First, check cached ingredients in the database
    db_ingredients = db.query(IngredientScore.ingredient_name).all()
    db_ingredient_names = {row.ingredient_name.lower() for row in db_ingredients}

    # Combine DB ingredients with static list (avoiding duplicates)
    static_ingredients = get_all_ingredients()
    all_ingredients = list(db_ingredient_names.union(
        ing.lower() for ing in static_ingredients
    ))

    # Calculate match scores for each ingredient
    for ingredient in all_ingredients:
        score = _calculate_match_score(query_lower, ingredient)
        if score > 0:
            category = get_ingredient_category(ingredient)
            results.append(
                IngredientSearchResult(
                    ingredient_name=ingredient,
                    match_score=score,
                    category=category
                )
            )

    # Sort by match_score descending
    results.sort(key=lambda x: x.match_score, reverse=True)

    # Apply limit
    limited_results = results[:limit]

    return IngredientSearchResponse(
        results=limited_results,
        total=len(results)
    )


def _calculate_match_score(query: str, ingredient: str) -> float:
    """Calculate a match score between a query and an ingredient name."""
    # Exact match
    if query == ingredient:
        return 1.0

    # Starts with query
    if ingredient.startswith(query):
        return 0.9

    # Check if query matches at word boundary
    words = ingredient.split()
    for word in words:
        if word.startswith(query):
            return 0.7

    # Contains query anywhere
    if query in ingredient:
        position = ingredient.index(query)
        position_factor = max(0.5, 0.7 - (position / len(ingredient)) * 0.2)
        return position_factor

    # Fuzzy matching - check character overlap
    query_set = set(query)
    ingredient_set = set(ingredient)
    common_chars = query_set.intersection(ingredient_set)

    if not common_chars:
        return 0.0

    overlap_ratio = len(common_chars) / len(query_set)
    if overlap_ratio >= 0.6:
        if _is_subsequence(query, ingredient):
            return min(0.4, overlap_ratio * 0.5)
        return min(0.3, overlap_ratio * 0.4)

    return 0.0


def _is_subsequence(query: str, ingredient: str) -> bool:
    """Check if query characters appear in order within ingredient."""
    query_idx = 0
    for char in ingredient:
        if query_idx < len(query) and char == query[query_idx]:
            query_idx += 1
    return query_idx == len(query)


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
        existing.set_symptoms_from_dict(log_data.symptoms.model_dump())
        existing.cycle_phase = log_data.cycle_phase
        db.commit()
        db.refresh(existing)
        return LogResponse(
            id=existing.id,
            date=existing.date,
            ingredients=existing.ingredients,
            symptoms=SymptomsOutput(**existing.get_symptoms_with_fallback()),
            cycle_phase=existing.cycle_phase,
            created_at=existing.created_at
        )

    # Create new log
    log = UserLog(
        user_id=current_user.id,
        date=log_date,
        ingredients=log_data.ingredients,
        cycle_phase=log_data.cycle_phase
    )
    log.set_symptoms_from_dict(log_data.symptoms.model_dump())
    db.add(log)
    db.commit()
    db.refresh(log)

    return LogResponse(
        id=log.id,
        date=log.date,
        ingredients=log.ingredients,
        symptoms=SymptomsOutput(**log.get_symptoms_with_fallback()),
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
            symptoms=SymptomsOutput(**log.get_symptoms_with_fallback()),
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
        symptoms=SymptomsOutput(**log.get_symptoms_with_fallback()),
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
