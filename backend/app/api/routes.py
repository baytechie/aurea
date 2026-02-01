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
    IngredientDetailedResponse, IngredientListItem, IngredientListResponse,
    HealthScores, HealthScoreDetail,
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
    # Check if email already exists (case-insensitive)
    email_lower = user_data.email.lower()
    existing_user = db.query(User).filter(User.email == email_lower).first()
    if existing_user:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Email already registered"
        )

    # Create new user (store email in lowercase)
    user = User(
        email=email_lower,
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
    # Find user (case-insensitive email lookup)
    user = db.query(User).filter(User.email == credentials.email.lower()).first()
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
    category: str = Query(None, description="Filter by category (e.g., 'Sweeteners', 'Fats & Oils')"),
    sort_by: str = Query(
        None,
        description="Sort by health score: overall, blood_sugar, inflammation, gut, disease_links"
    ),
    db: Session = Depends(get_db)
):
    """
    Search for ingredients by name (autocomplete).

    - Uses fuzzy matching (case-insensitive, partial match)
    - Checks cached ingredients in DB first
    - Falls back to static ingredient list
    - Returns match_score based on how closely the query matches
    - Results sorted by match_score descending (unless sort_by is specified)
    - Optional category filter to narrow results
    - Optional sort_by to order by health impact scores
    """
    from app.data.common_ingredients import get_all_ingredients, get_ingredient_category

    query_lower = q.lower().strip()
    results = []

    # Build query for DB ingredients with optional category filter
    db_query = db.query(IngredientScore)
    if category:
        db_query = db_query.filter(IngredientScore.category == category)

    db_ingredients = db_query.all()

    # Build a map of ingredient name to DB record for score lookups
    db_ingredient_map = {row.ingredient_name.lower(): row for row in db_ingredients}
    db_ingredient_names = set(db_ingredient_map.keys())

    # Get static ingredients (only if no category filter or handle differently)
    if category:
        # When filtering by category, only use DB ingredients
        all_ingredients = list(db_ingredient_names)
    else:
        # Combine DB ingredients with static list (avoiding duplicates)
        static_ingredients = get_all_ingredients()
        all_ingredients = list(db_ingredient_names.union(
            ing.lower() for ing in static_ingredients
        ))

    # Calculate match scores for each ingredient
    for ingredient in all_ingredients:
        score = _calculate_match_score(query_lower, ingredient)
        if score > 0:
            # Get category from DB if available, otherwise from static data
            if ingredient in db_ingredient_map:
                ing_category = db_ingredient_map[ingredient].category
            else:
                ing_category = get_ingredient_category(ingredient)

            results.append(
                IngredientSearchResult(
                    ingredient_name=ingredient,
                    match_score=score,
                    category=ing_category
                )
            )

    # Apply sorting based on sort_by parameter
    valid_sort_options = ['overall', 'blood_sugar', 'inflammation', 'gut', 'disease_links']
    if sort_by and sort_by in valid_sort_options:
        # Sort by the specified health score (descending), putting ingredients without scores last
        score_field_map = {
            'overall': 'overall_score',
            'blood_sugar': 'blood_sugar_impact',
            'inflammation': 'inflammation_potential',
            'gut': 'gut_impact',
            'disease_links': 'disease_links'
        }
        field_name = score_field_map[sort_by]

        def get_sort_score(result):
            ing_name = result.ingredient_name.lower()
            if ing_name in db_ingredient_map:
                score_val = getattr(db_ingredient_map[ing_name], field_name, None)
                return (0, -(score_val or 0))  # Sort None/0 to bottom, higher scores first
            return (1, 0)  # Ingredients without DB data go to the end

        results.sort(key=get_sort_score)
    else:
        # Default: sort by match_score descending
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


def _build_health_score_detail(details: dict) -> HealthScoreDetail:
    """Build a HealthScoreDetail from a details dict.

    Handles both the new format with confidence_level and legacy format.
    """
    if not details:
        return None

    return HealthScoreDetail(
        score=details.get('score'),
        confidence=details.get('confidence_level') or details.get('confidence'),
        description=details.get('description')
    )


def _build_ingredient_detailed_response(cached: IngredientScore) -> IngredientDetailedResponse:
    """Build a detailed ingredient response from a database record.

    Constructs the health_scores object from individual detail fields
    while maintaining backward compatibility with legacy fields.
    """
    # Build health scores from detail fields
    health_scores = HealthScores(
        blood_sugar=_build_health_score_detail(cached.blood_sugar_details),
        inflammation=_build_health_score_detail(cached.inflammation_details),
        gut_impact=_build_health_score_detail(cached.gut_impact_details),
        disease_links=_build_health_score_detail(cached.disease_links_details),
        hormonal=_build_health_score_detail(cached.hormonal_relevance)
    )

    # Fill in scores from top-level fields if details don't have them
    if health_scores.blood_sugar and health_scores.blood_sugar.score is None:
        health_scores.blood_sugar.score = cached.blood_sugar_impact
    elif health_scores.blood_sugar is None and cached.blood_sugar_impact is not None:
        health_scores.blood_sugar = HealthScoreDetail(score=cached.blood_sugar_impact)

    if health_scores.inflammation and health_scores.inflammation.score is None:
        health_scores.inflammation.score = cached.inflammation_potential
    elif health_scores.inflammation is None and cached.inflammation_potential is not None:
        health_scores.inflammation = HealthScoreDetail(score=cached.inflammation_potential)

    if health_scores.gut_impact and health_scores.gut_impact.score is None:
        health_scores.gut_impact.score = cached.gut_impact
    elif health_scores.gut_impact is None and cached.gut_impact is not None:
        health_scores.gut_impact = HealthScoreDetail(score=cached.gut_impact)

    if health_scores.disease_links and health_scores.disease_links.score is None:
        health_scores.disease_links.score = cached.disease_links
    elif health_scores.disease_links is None and cached.disease_links is not None:
        health_scores.disease_links = HealthScoreDetail(score=cached.disease_links)

    return IngredientDetailedResponse(
        name=cached.ingredient_name,
        category=cached.category,
        overall_score=cached.overall_score,
        is_trusted=bool(cached.is_trusted),
        health_scores=health_scores,
        evidence_confidence=cached.evidence_confidence,
        sources=cached.sources,
        # Legacy fields for backward compatibility
        blood_sugar_impact=cached.blood_sugar_impact,
        inflammation_potential=cached.inflammation_potential,
        gut_impact=cached.gut_impact,
        disease_links=cached.disease_links,
        hormonal_relevance=cached.hormonal_relevance
    )


@router.get("/ingredient/{name}", response_model=IngredientDetailedResponse, tags=["Ingredients"])
async def get_ingredient_score(name: str, db: Session = Depends(get_db)):
    """
    Get detailed health scores for an ingredient.

    Returns comprehensive health information including:
    - Overall score and category
    - Health scores with confidence levels and descriptions for:
      - Blood sugar impact
      - Inflammation potential
      - Gut impact
      - Disease links
      - Hormonal relevance
    - Trust indicator (is_trusted)
    - Source citations

    Legacy fields (blood_sugar_impact, inflammation_potential, etc.) are
    included for backward compatibility with existing clients.

    Note: Scoring service is a stub - implement in services/ingredient_scorer.py
    """
    # Normalize ingredient name
    normalized_name = name.lower().strip()

    # Check cache
    cached = db.query(IngredientScore).filter(
        IngredientScore.ingredient_name == normalized_name
    ).first()

    if cached:
        return _build_ingredient_detailed_response(cached)

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
    db.refresh(cached_score)

    return _build_ingredient_detailed_response(cached_score)


@router.get("/ingredients/list", response_model=IngredientListResponse, tags=["Ingredients"])
async def list_ingredients(
    category: str = Query(None, description="Filter by category (e.g., 'Sweeteners', 'Fats & Oils')"),
    sort_by: str = Query(
        "overall",
        description="Sort by: overall, blood_sugar, inflammation, gut, disease_links, name"
    ),
    sort_order: str = Query("desc", description="Sort order: asc or desc"),
    page: int = Query(1, ge=1, description="Page number"),
    page_size: int = Query(20, ge=1, le=100, description="Number of items per page"),
    db: Session = Depends(get_db)
):
    """
    List all ingredients with optional filtering and sorting.

    Returns paginated list of ingredients from the database with:
    - Category classification
    - Overall health score
    - Individual health impact scores
    - Trust indicator

    Use this endpoint to browse the ingredient database or build
    category-specific ingredient lists for the UI.
    """
    from math import ceil

    # Build base query
    query = db.query(IngredientScore)

    # Apply category filter if provided
    if category:
        query = query.filter(IngredientScore.category == category)

    # Get total count before pagination
    total = query.count()

    # Apply sorting
    sort_field_map = {
        'overall': IngredientScore.overall_score,
        'blood_sugar': IngredientScore.blood_sugar_impact,
        'inflammation': IngredientScore.inflammation_potential,
        'gut': IngredientScore.gut_impact,
        'disease_links': IngredientScore.disease_links,
        'name': IngredientScore.ingredient_name
    }

    sort_field = sort_field_map.get(sort_by, IngredientScore.overall_score)

    if sort_order.lower() == 'asc':
        # For ascending, put nulls last
        query = query.order_by(sort_field.asc().nullslast())
    else:
        # For descending, put nulls last
        query = query.order_by(sort_field.desc().nullslast())

    # Apply pagination
    offset = (page - 1) * page_size
    ingredients = query.offset(offset).limit(page_size).all()

    # Calculate total pages
    total_pages = ceil(total / page_size) if total > 0 else 1

    # Build response items
    items = [
        IngredientListItem(
            name=ing.ingredient_name,
            category=ing.category,
            overall_score=ing.overall_score,
            is_trusted=bool(ing.is_trusted),
            blood_sugar_impact=ing.blood_sugar_impact,
            inflammation_potential=ing.inflammation_potential,
            gut_impact=ing.gut_impact,
            disease_links=ing.disease_links
        )
        for ing in ingredients
    ]

    return IngredientListResponse(
        ingredients=items,
        total=total,
        page=page,
        page_size=page_size,
        total_pages=total_pages
    )


@router.get("/ingredients/categories", tags=["Ingredients"])
async def list_ingredient_categories(db: Session = Depends(get_db)):
    """
    Get all available ingredient categories.

    Returns a list of unique category names with ingredient counts.
    Useful for building category filter UI components.
    """
    from sqlalchemy import func

    # Query distinct categories with counts
    results = db.query(
        IngredientScore.category,
        func.count(IngredientScore.id).label('count')
    ).filter(
        IngredientScore.category.isnot(None)
    ).group_by(
        IngredientScore.category
    ).order_by(
        IngredientScore.category
    ).all()

    categories = [
        {"name": row.category, "count": row.count}
        for row in results
    ]

    return {
        "categories": categories,
        "total": len(categories)
    }


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
