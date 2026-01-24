# ADR-001: Aurea System Architecture

**Status:** Proposed
**Date:** 2026-01-20
**Decision Makers:** Engineering Team

---

## Context and Problem Statement

Aurea is a personal ingredient and symptom predictor platform that helps users track food consumption and correlate it with health symptoms. The system needs to:

1. Fetch and aggregate ingredient data from multiple external APIs (Open Food Facts, USDA)
2. Score ingredients based on health impact dimensions (blood sugar, inflammation, gut health, hormonal)
3. Train per-user ML models to predict symptom outcomes based on personal history
4. Generate insights by analyzing correlations between ingredients and symptoms
5. Handle growth to 1,000+ users with 100 logs each while maintaining responsive API times

The current scaffolding includes stub services that need real implementation. This ADR defines the architecture to guide that implementation.

---

## Decision Drivers

1. **Accuracy over Speed**: Health predictions must be reliable; users depend on this data
2. **User Privacy**: Personal health data requires strict isolation and security
3. **Scalability**: Architecture must handle 100K+ log entries without degradation
4. **Cost Efficiency**: Minimize external API calls and compute resources
5. **Maintainability**: Clear separation of concerns for future development
6. **Testability**: Each component should be independently testable
7. **Latency**: API responses should be under 200ms for cached data, under 2s for new ingredient scoring

---

## System Architecture Overview

```
+-----------------------------------------------------------------------------------+
|                                    FRONTEND                                        |
|                              React + TanStack Query                               |
+-----------------------------------------------------------------------------------+
                                        |
                                        | HTTPS/REST
                                        v
+-----------------------------------------------------------------------------------+
|                                  API GATEWAY                                       |
|                     FastAPI + Rate Limiting + Auth Middleware                     |
+-----------------------------------------------------------------------------------+
        |                    |                    |                    |
        v                    v                    v                    v
+---------------+    +---------------+    +---------------+    +---------------+
|   Ingredient  |    |     Log       |    |  Prediction   |    |   Insight     |
|   Controller  |    |  Controller   |    |  Controller   |    |  Controller   |
+---------------+    +---------------+    +---------------+    +---------------+
        |                    |                    |                    |
        v                    v                    v                    v
+-----------------------------------------------------------------------------------+
|                              SERVICE LAYER                                         |
+-----------------------------------------------------------------------------------+
|                                                                                   |
|  +---------------------+  +---------------------+  +---------------------+        |
|  | IngredientDataFetcher|  |  IngredientScorer  |  |    MLPredictor     |        |
|  |                     |  |                     |  |                     |        |
|  | - Open Food Facts   |  | - Blood Sugar       |  | - Per-User Models  |        |
|  | - USDA FoodData     |  | - Inflammation      |  | - Feature Eng.     |        |
|  | - Data Merging      |  | - Gut Health        |  | - Prediction       |        |
|  | - Normalization     |  | - Hormonal          |  | - Confidence       |        |
|  +---------------------+  +---------------------+  +---------------------+        |
|                                                                                   |
|  +---------------------+  +---------------------+  +---------------------+        |
|  |   InsightEngine    |  |   CacheManager      |  | BackgroundWorker   |        |
|  |                     |  |                     |  |                     |        |
|  | - Correlations     |  | - Ingredient Cache  |  | - Model Retraining |        |
|  | - Lag Analysis     |  | - Score Cache       |  | - Insight Refresh  |        |
|  | - Recommendations  |  | - Insight Cache     |  | - Cache Warming    |        |
|  +---------------------+  +---------------------+  +---------------------+        |
|                                                                                   |
+-----------------------------------------------------------------------------------+
        |                    |                    |                    |
        v                    v                    v                    v
+-----------------------------------------------------------------------------------+
|                              DATA LAYER                                            |
+-----------------------------------------------------------------------------------+
|                                                                                   |
|  +-------------------------+  +-------------------------+  +------------------+  |
|  |      PostgreSQL         |  |         Redis           |  |   File Storage   |  |
|  |                         |  |                         |  |                  |  |
|  | - users                 |  | - ingredient_cache      |  | - ML Models      |  |
|  | - user_logs             |  | - score_cache           |  |   (pickle/joblib)|  |
|  | - ingredient_scores     |  | - rate_limit_counters   |  | - Model Metadata |  |
|  | - predictions           |  | - insight_cache         |  |                  |  |
|  | - user_insights (new)   |  | - session_store         |  |                  |  |
|  +-------------------------+  +-------------------------+  +------------------+  |
|                                                                                   |
+-----------------------------------------------------------------------------------+
        |
        v
+-----------------------------------------------------------------------------------+
|                            EXTERNAL SERVICES                                       |
+-----------------------------------------------------------------------------------+
|  +---------------------+  +---------------------+  +---------------------+        |
|  |  Open Food Facts    |  |   USDA FoodData    |  |  Future: PubMed    |        |
|  |       API           |  |   Central API       |  |   Literature API   |        |
|  +---------------------+  +---------------------+  +---------------------+        |
+-----------------------------------------------------------------------------------+
```

---

## Component Descriptions

### 1. IngredientDataFetcher

**Purpose:** Aggregate ingredient data from multiple external APIs into a normalized format.

**Responsibilities:**
- Query Open Food Facts API for ingredient/product data
- Query USDA FoodData Central API for nutritional information
- Normalize ingredient names (lowercase, remove special characters, handle aliases)
- Merge data from multiple sources with conflict resolution
- Implement circuit breaker pattern for API resilience
- Rate limit external API calls

**Interface:**

```python
class IngredientDataFetcher:
    async def fetch(self, ingredient_name: str) -> Optional[IngredientData]:
        """Fetch and merge data from all sources."""

    async def fetch_batch(self, names: List[str]) -> Dict[str, IngredientData]:
        """Batch fetch for efficiency."""

    async def search(self, query: str, limit: int = 10) -> List[IngredientData]:
        """Search for ingredients matching query."""
```

**Data Source Priority:**
1. **USDA** (primary): Most accurate nutritional data, peer-reviewed
2. **Open Food Facts** (secondary): Better coverage of processed foods, additives, allergens
3. **Internal Database** (fallback): User-contributed or manually curated data

**Merge Strategy:**

```
+------------------+-------------------+----------------------+
| Data Field       | Primary Source    | Fallback Source      |
+------------------+-------------------+----------------------+
| Macronutrients   | USDA              | Open Food Facts      |
| Glycemic Index   | USDA (if present) | Open Food Facts      |
| Additives/E-nums | Open Food Facts   | N/A                  |
| Allergens        | Open Food Facts   | USDA                 |
| Category         | Open Food Facts   | USDA                 |
+------------------+-------------------+----------------------+
```

---

### 2. IngredientScorer

**Purpose:** Calculate health impact scores across multiple dimensions.

**Scoring Dimensions:**

| Dimension              | Range   | Meaning                                    |
|------------------------|---------|-------------------------------------------|
| Blood Sugar Impact     | 0-100   | Higher = better (less blood sugar spike)  |
| Inflammation Potential | 0-100   | Higher = worse (more inflammatory)        |
| Gut Impact             | 0-100   | Higher = better (more gut-friendly)       |
| Hormonal Relevance     | 0-100   | Higher = more impactful on hormones       |
| Overall Score          | 0-100   | Higher = better overall health impact     |

**Scoring Algorithm (Rule-Based):**

```
BLOOD_SUGAR_SCORE:
  Base: 50

  Glycemic Index Adjustment:
    GI < 35:  +40 to +50 (low GI foods)
    GI 35-55: +10 to +39 (medium GI)
    GI > 55:  -20 to +9 (high GI)
    GI > 70:  -30 to -10 (very high GI)

  Fiber Adjustment:
    fiber_g > 5:  +10
    fiber_g > 10: +15

  Sugar Adjustment:
    added_sugars > 10g: -20
    added_sugars > 20g: -30

  Clamp to [0, 100]

INFLAMMATION_SCORE:
  Base: 30

  Omega-6/Omega-3 Ratio:
    ratio > 10: +40 (pro-inflammatory)
    ratio 5-10: +20
    ratio < 5:  +0
    ratio < 2:  -10 (anti-inflammatory)

  Trans Fat:
    trans_fat > 0: +30

  Saturated Fat:
    sat_fat > 5g: +15

  Antioxidants:
    vitamin_c > 20mg: -10
    vitamin_e > 5mg: -10

  Known Inflammatory Compounds:
    refined_sugar: +15
    refined_grains: +10
    artificial_sweeteners: +10

  Anti-inflammatory Compounds:
    polyphenols_present: -15
    omega_3_rich: -20

  Clamp to [0, 100]

GUT_IMPACT_SCORE:
  Base: 50

  Fiber:
    fiber_g > 3: +15
    fiber_g > 7: +25

  Fermented:
    is_fermented: +20

  Prebiotics:
    contains_prebiotics: +15

  Harmful Additives:
    artificial_sweeteners: -20
    emulsifiers (carrageenan, polysorbate): -15
    artificial_colors: -10

  Clamp to [0, 100]

HORMONAL_RELEVANCE_SCORE:
  Returns detailed breakdown:
  {
    "score": 0-100,
    "insulin_impact": "low" | "moderate" | "high",
    "estrogen_impact": "low" | "moderate" | "high",
    "cortisol_impact": "low" | "moderate" | "high",
    "details": "Human readable explanation"
  }

  Factors:
    - High GI foods -> high insulin impact
    - Phytoestrogens (soy, flax) -> moderate estrogen impact
    - Caffeine -> moderate cortisol impact
    - Refined carbs -> high insulin impact

OVERALL_SCORE:
  = (blood_sugar * 0.30)
  + ((100 - inflammation) * 0.30)  # Invert inflammation
  + (gut * 0.25)
  + ((100 - hormonal.score) * 0.15)  # Lower hormonal impact is better
```

**Evidence Confidence Determination:**

```
CONFIDENCE_LEVEL:
  "high":
    - Data from USDA (peer-reviewed)
    - Multiple sources agree
    - Well-studied ingredient (>100 studies)

  "medium":
    - Single reliable source
    - Some nutritional data missing
    - Moderately studied ingredient

  "low":
    - User-contributed data only
    - Significant data gaps
    - Novel or obscure ingredient
```

---

### 3. MLPredictor (PersonalPredictorModel)

**Purpose:** Train and maintain per-user ML models for personalized symptom prediction.

**Architecture Decision: Model Storage**

| Option                    | Pros                                  | Cons                               |
|---------------------------|---------------------------------------|-----------------------------------|
| A. Pickle Files           | Simple, fast load, sklearn native     | No versioning, filesystem mgmt    |
| B. Database BLOB          | Single storage layer, backup included | Large BLOBs, serialization overhead|
| C. Joblib + Metadata DB   | Best of both, versioned, auditable    | Slightly more complex             |

**Recommendation:** Option C - Joblib files with metadata in database

```
models/
  {user_id}/
    model_v1_2026-01-20.joblib
    model_v2_2026-01-27.joblib
    metadata.json

database.user_models:
  - user_id
  - model_version
  - model_path
  - trained_at
  - training_samples
  - accuracy_metrics
  - is_active
```

**Model Selection:**

```
IF user_logs.count < 14:
    return ColdStartPredictor()  # Rule-based fallback

IF user_logs.count < 50:
    return LogisticRegression(
        class_weight='balanced',
        max_iter=1000
    )  # Interpretable, handles small data well

IF user_logs.count >= 50:
    return GradientBoostingClassifier(
        n_estimators=100,
        max_depth=4,
        learning_rate=0.1
    )  # Better accuracy with more data
```

**Feature Engineering Pipeline:**

```
RAW_FEATURES:
  - ingredients: List[str]
  - cycle_phase: Optional[str]
  - date: Date
  - symptoms: Dict[str, int]

ENGINEERED_FEATURES:
  For each ingredient in user's vocabulary:
    - present_today: bool (1/0)
    - present_last_3_days: bool
    - frequency_last_7_days: int
    - days_since_last: int

  Temporal features:
    - day_of_week: int (0-6)
    - is_weekend: bool
    - days_since_first_log: int

  Cycle features (if available):
    - cycle_phase_onehot: 4 features
    - days_until_menstruation: int (estimated)

  Rolling symptom features:
    - avg_bloating_last_7_days: float
    - avg_energy_last_7_days: float
    - symptom_trend: increasing/stable/decreasing

TARGET_VARIABLES:
  Multi-output classification/regression:
    - bloating_binary: bool (symptoms.bloating >= 3)
    - bloating_score: int (0-5, for regression)
    - energy_low: bool (symptoms.energy <= 2)
    - brain_fog: bool (symptoms.focus <= 2)
```

**Training Pipeline:**

```
1. FETCH user logs (last 90 days, or all if fewer)
2. CHECK minimum samples (14 required)
3. PREPARE features using FeatureEngineering
4. SPLIT train/validation (80/20, time-based)
5. TRAIN model with cross-validation
6. EVALUATE on validation set
7. IF accuracy >= threshold:
     SAVE model to filesystem
     UPDATE metadata in database
     MARK as active
   ELSE:
     KEEP previous model active
     LOG training failure
```

**Cold Start Strategy:**

For users with insufficient data:

```python
class ColdStartPredictor:
    """
    Rule-based predictions for new users.
    Uses population averages and ingredient scores.
    """

    def predict(self, ingredients: List[str]) -> PredictionResult:
        # Fetch ingredient scores
        scores = [get_score(ing) for ing in ingredients]

        # Average scores indicate risk
        avg_gut_score = mean([s.gut_impact for s in scores])
        avg_inflammation = mean([s.inflammation_potential for s in scores])

        # Higher inflammation or lower gut score -> higher bloating risk
        bloating_prob = 0.5 - (avg_gut_score - 50) / 200 + avg_inflammation / 200

        return PredictionResult(
            bloating_probability=clamp(bloating_prob, 0.1, 0.9),
            confidence="low",
            interpretation="Based on general health data. Keep logging for personalized predictions!"
        )
```

---

### 4. InsightEngine

**Purpose:** Analyze user log history to identify patterns and correlations.

**Analysis Modules:**

```
1. TRIGGER_IDENTIFICATION
   - For each ingredient consumed > 3 times:
     - Split logs: ingredient_present vs ingredient_absent
     - Calculate symptom differences between groups
     - Apply statistical test (Mann-Whitney U for small samples)
     - Record correlation coefficient (point-biserial)
   - Filter by significance (p < 0.05)
   - Apply Bonferroni correction for multiple comparisons
   - Return top 5 triggers sorted by |correlation|

2. CYCLE_PHASE_ANALYSIS
   - Group logs by cycle_phase
   - Calculate mean symptoms per phase
   - ANOVA test for significant differences
   - Identify phases with worst symptoms
   - Generate phase-specific recommendations

3. LAG_EFFECT_ANALYSIS
   - For each ingredient:
     - Test correlations at lag 0, 1, 2, 3 days
     - Find optimal lag (highest correlation)
   - Use cross-correlation function
   - Report ingredients with delayed effects

4. TIME_PATTERN_ANALYSIS
   - Day of week effects (t-test weekday vs weekend)
   - Trend analysis (linear regression over time)
   - Seasonal patterns (if >3 months data)
```

**Caching Strategy:**

```
Insights are expensive to compute. Cache with intelligent invalidation:

CACHE_KEY: f"insights:{user_id}:{log_count_hash}"

CACHE_DURATION: 24 hours

INVALIDATION_TRIGGERS:
  - New log created
  - Log updated
  - Log deleted
  - Manual refresh requested

STALE-WHILE-REVALIDATE:
  - Return cached insights immediately
  - Trigger background refresh if cache > 12 hours old
```

---

## Data Flow Sequences

### Flow 1: Ingredient Score Request

```
User                Frontend              API                 Service              Cache               External API
  |                    |                   |                     |                   |                      |
  |--Search "sugar"--->|                   |                     |                   |                      |
  |                    |--GET /ingredient/sugar----------------->|                   |                      |
  |                    |                   |--Check Cache--------|------------------>|                      |
  |                    |                   |                     |<--MISS------------|                      |
  |                    |                   |                     |                   |                      |
  |                    |                   |--Fetch External-----|-------------------------------->|        |
  |                    |                   |                     |<-----USDA Data-----------------|        |
  |                    |                   |--Fetch External-----|-------------------------------->|        |
  |                    |                   |                     |<-----OFF Data------------------|        |
  |                    |                   |                     |                   |                      |
  |                    |                   |<--Merge & Score-----|                   |                      |
  |                    |                   |--Store in Cache-----|------------------>|                      |
  |                    |                   |--Store in DB--------|                   |                      |
  |                    |<--200 + Scores----|                     |                   |                      |
  |<---Display---------|                   |                     |                   |                      |
```

### Flow 2: Daily Log Submission

```
User                Frontend              API                 Service              Database
  |                    |                   |                     |                     |
  |--Submit Log------->|                   |                     |                     |
  |                    |--POST /logs------>|                     |                     |
  |                    |                   |--Validate-----------|                     |
  |                    |                   |--Store Log----------|-------------------->|
  |                    |                   |                     |<--Saved-------------|
  |                    |                   |                     |                     |
  |                    |                   |--Invalidate Caches--|                     |
  |                    |                   |   (predictions,     |                     |
  |                    |                   |    insights)        |                     |
  |                    |                   |                     |                     |
  |                    |                   |--Queue Retrain------|  (if log_count      |
  |                    |                   |   (background)      |   % 7 == 0)        |
  |                    |                   |                     |                     |
  |                    |<--201 Created-----|                     |                     |
  |<---Confirmation----|                   |                     |                     |
```

### Flow 3: Prediction Request

```
User                Frontend              API                 MLPredictor           Model Storage
  |                    |                   |                     |                     |
  |--"Predict for      |                   |                     |                     |
  |   dairy, sugar"--->|                   |                     |                     |
  |                    |--POST /predictions|                     |                     |
  |                    |                   |--Load Model---------|-------------------->|
  |                    |                   |                     |<--Model (if exists)-|
  |                    |                   |                     |                     |
  |                    |                   |--Predict------------|                     |
  |                    |                   |                     |                     |
  |                    |                   |   [IF no model]     |                     |
  |                    |                   |   --Use ColdStart---|                     |
  |                    |                   |                     |                     |
  |                    |                   |<--PredictionResult--|                     |
  |                    |                   |--Store Prediction---|--->(Database)       |
  |                    |<--200 + Result----|                     |                     |
  |<---Display---------|                   |                     |                     |
```

### Flow 4: Insight Generation

```
User                Frontend              API               InsightEngine            Cache            Database
  |                    |                   |                     |                     |                  |
  |--View Insights---->|                   |                     |                     |                  |
  |                    |--GET /insights--->|                     |                     |                  |
  |                    |                   |--Check Cache--------|-------------------->|                  |
  |                    |                   |                     |<--HIT (stale)-------|                  |
  |                    |                   |                     |                     |                  |
  |                    |<--200 + Cached----|                     |                     |                  |
  |<---Display---------|                   |                     |                     |                  |
  |                    |                   |                     |                     |                  |
  |                    |                   |--Queue Refresh------|  (async, stale-while-revalidate)      |
  |                    |                   |                     |                     |                  |
  |                    |                   |                     |--Fetch Logs--------|----------------->|
  |                    |                   |                     |<--Logs-------------|------------------|
  |                    |                   |                     |                     |                  |
  |                    |                   |                     |--Analyze-----------|                  |
  |                    |                   |                     |   (triggers,       |                  |
  |                    |                   |                     |    cycles,         |                  |
  |                    |                   |                     |    lags)           |                  |
  |                    |                   |                     |                     |                  |
  |                    |                   |                     |--Update Cache------|----------------->|
```

### Flow 5: Background Model Retraining

```
Scheduler           BackgroundWorker      MLPredictor           Database           Model Storage
  |                    |                     |                     |                     |
  |--Trigger Daily---->|                     |                     |                     |
  |                    |--Get Users to       |                     |                     |
  |                    |  Retrain------------|-------------------->|                     |
  |                    |                     |<--User List---------|                     |
  |                    |                     |                     |                     |
  |                    |  FOR EACH user:     |                     |                     |
  |                    |  ---------------    |                     |                     |
  |                    |--Train Model------->|                     |                     |
  |                    |                     |--Fetch Logs---------|-------------------->|
  |                    |                     |<--Logs--------------|                     |
  |                    |                     |                     |                     |
  |                    |                     |--Train & Evaluate---|                     |
  |                    |                     |                     |                     |
  |                    |                     |--Save Model---------|-------------------->|
  |                    |                     |--Update Metadata----|-------------------->|
  |                    |                     |                     |                     |
  |                    |<--Complete----------|                     |                     |
```

---

## Caching Strategy

### Multi-Layer Cache Architecture

```
+------------------+     +------------------+     +------------------+
|    L1 Cache      |     |    L2 Cache      |     |    Database     |
|  (In-Memory)     |     |    (Redis)       |     |  (PostgreSQL)   |
+------------------+     +------------------+     +------------------+
|                  |     |                  |     |                  |
| - Hot ingredient | --> | - All ingredient | --> | - All ingredient |
|   scores (100)   |     |   scores         |     |   scores        |
|                  |     |                  |     |                  |
| - Active user    | --> | - User insights  |     | - User insights  |
|   insights       |     |   (24h TTL)      |     |   (persistent)   |
|                  |     |                  |     |                  |
| TTL: 5 min       |     | TTL: varies      |     | TTL: none        |
+------------------+     +------------------+     +------------------+
```

### Cache Key Patterns

```
INGREDIENT_SCORE:
  Key:    ingredient:score:{normalized_name}
  TTL:    7 days (scores rarely change)
  Size:   ~500 bytes per ingredient

INGREDIENT_DATA:
  Key:    ingredient:data:{normalized_name}
  TTL:    24 hours (external API data may update)
  Size:   ~2KB per ingredient

USER_INSIGHTS:
  Key:    user:insights:{user_id}:{data_hash}
  TTL:    24 hours
  Size:   ~5KB per user

USER_MODEL_METADATA:
  Key:    user:model:{user_id}
  TTL:    Until retrain
  Size:   ~200 bytes per user

RATE_LIMIT:
  Key:    ratelimit:{api_name}:{window}
  TTL:    1 minute
  Type:   Counter
```

### Cache Invalidation Rules

```
ON log_created OR log_updated OR log_deleted:
  INVALIDATE user:insights:{user_id}:*
  INVALIDATE user:model:{user_id} (mark stale)

ON ingredient_score_updated:
  INVALIDATE ingredient:score:{name}
  INVALIDATE ingredient:data:{name}

ON model_retrained:
  UPDATE user:model:{user_id}
```

---

## Background Job Architecture

### Job Types and Scheduling

```
+---------------------------+------------+------------------+-------------------+
| Job                       | Schedule   | Trigger          | Priority          |
+---------------------------+------------+------------------+-------------------+
| Model Retraining          | Daily 3AM  | Also on demand   | Medium            |
| Insight Refresh           | Daily 4AM  | On cache miss    | Low               |
| Cache Warming             | Daily 5AM  | -                | Low               |
| Stale Score Refresh       | Weekly     | -                | Low               |
| External API Health Check | Every 5min | -                | High              |
+---------------------------+------------+------------------+-------------------+
```

### Job Queue Architecture

**Option A: Simple In-Process (Development)**
```python
# Using FastAPI BackgroundTasks
@router.post("/logs")
async def create_log(background_tasks: BackgroundTasks):
    # ... save log ...
    background_tasks.add_task(invalidate_user_cache, user_id)
    background_tasks.add_task(maybe_retrain_model, user_id)
```

**Option B: Celery + Redis (Production)**
```
+----------------+     +----------------+     +----------------+
|   FastAPI      | --> |     Redis      | --> |    Celery      |
|   (Producer)   |     |    (Broker)    |     |   (Workers)    |
+----------------+     +----------------+     +----------------+
                                                     |
                              +----------------------+----------------------+
                              |                      |                      |
                       +------v------+       +-------v-----+       +-------v-----+
                       | ML Worker   |       | Cache Worker|       | API Worker  |
                       | (retrain)   |       | (refresh)   |       | (fetch)     |
                       +-------------+       +-------------+       +-------------+
```

**Recommendation:** Start with Option A, migrate to Option B when:
- Processing time exceeds API timeout
- Need horizontal scaling
- Job failure recovery becomes critical

### Retraining Logic

```python
def should_retrain_model(user_id: UUID) -> bool:
    """Determine if a user's model needs retraining."""

    model_meta = get_model_metadata(user_id)
    user_logs = get_user_log_count(user_id)

    # Never trained
    if model_meta is None:
        return user_logs >= MIN_LOGS_FOR_TRAINING  # 14

    # Check staleness
    days_since_training = (now() - model_meta.trained_at).days
    new_logs_since = user_logs - model_meta.training_samples

    return (
        days_since_training >= 7 or  # Weekly at minimum
        new_logs_since >= 7 or       # 7+ new logs
        new_logs_since / model_meta.training_samples > 0.2  # 20% new data
    )
```

---

## Rate Limiting for External APIs

### Rate Limit Configuration

```
+------------------+------------------+------------------+------------------+
| API              | Limit            | Window           | Strategy         |
+------------------+------------------+------------------+------------------+
| Open Food Facts  | 100 req/min      | Rolling 60s      | Token Bucket     |
| USDA FoodData    | 1000 req/hour    | Rolling 3600s    | Token Bucket     |
| Internal API     | 60 req/min/user  | Rolling 60s      | Sliding Window   |
+------------------+------------------+------------------+------------------+
```

### Implementation Pattern

```python
class RateLimiter:
    """Token bucket rate limiter with Redis backend."""

    def __init__(self, redis: Redis, key: str, rate: int, window: int):
        self.redis = redis
        self.key = key
        self.rate = rate  # tokens per window
        self.window = window  # window in seconds

    async def acquire(self, tokens: int = 1) -> bool:
        """Try to acquire tokens. Returns True if allowed."""

        now = time.time()
        window_start = now - self.window

        pipe = self.redis.pipeline()

        # Remove old entries
        pipe.zremrangebyscore(self.key, 0, window_start)

        # Count recent requests
        pipe.zcard(self.key)

        # Add current request (optimistically)
        pipe.zadd(self.key, {str(now): now})

        # Set expiry
        pipe.expire(self.key, self.window)

        results = await pipe.execute()
        request_count = results[1]

        if request_count >= self.rate:
            # Over limit - remove the optimistic add
            await self.redis.zrem(self.key, str(now))
            return False

        return True

    async def wait_and_acquire(self, tokens: int = 1, timeout: float = 30):
        """Wait until tokens available or timeout."""

        deadline = time.time() + timeout

        while time.time() < deadline:
            if await self.acquire(tokens):
                return True
            await asyncio.sleep(0.1)

        raise RateLimitExceeded(f"Could not acquire {tokens} tokens within {timeout}s")
```

### Circuit Breaker Pattern

```python
class CircuitBreaker:
    """
    Prevent cascading failures when external APIs are down.

    States:
      CLOSED: Normal operation, requests pass through
      OPEN: API is down, fail fast without calling
      HALF_OPEN: Testing if API recovered
    """

    def __init__(
        self,
        failure_threshold: int = 5,
        recovery_timeout: int = 30,
        success_threshold: int = 2
    ):
        self.failure_threshold = failure_threshold
        self.recovery_timeout = recovery_timeout
        self.success_threshold = success_threshold

        self.state = "CLOSED"
        self.failure_count = 0
        self.success_count = 0
        self.last_failure_time = None

    async def call(self, func, *args, **kwargs):
        if self.state == "OPEN":
            if time.time() - self.last_failure_time > self.recovery_timeout:
                self.state = "HALF_OPEN"
            else:
                raise CircuitOpen("Circuit breaker is open")

        try:
            result = await func(*args, **kwargs)
            self._record_success()
            return result
        except Exception as e:
            self._record_failure()
            raise

    def _record_failure(self):
        self.failure_count += 1
        self.last_failure_time = time.time()

        if self.failure_count >= self.failure_threshold:
            self.state = "OPEN"

    def _record_success(self):
        if self.state == "HALF_OPEN":
            self.success_count += 1
            if self.success_count >= self.success_threshold:
                self.state = "CLOSED"
                self.failure_count = 0
                self.success_count = 0
```

---

## Database Indexing Strategy

### Current Tables and Proposed Indexes

```sql
-- users table
CREATE INDEX idx_users_email ON users(email);  -- Already exists (unique)

-- user_logs table (most queried)
CREATE INDEX idx_user_logs_user_id ON user_logs(user_id);  -- Exists
CREATE INDEX idx_user_logs_date ON user_logs(date);  -- Exists
CREATE INDEX idx_user_logs_user_date ON user_logs(user_id, date DESC);  -- Composite for common query
CREATE INDEX idx_user_logs_user_created ON user_logs(user_id, created_at DESC);  -- For pagination

-- ingredient_scores table
CREATE INDEX idx_ingredient_scores_name ON ingredient_scores(ingredient_name);  -- Exists (unique)
CREATE INDEX idx_ingredient_scores_overall ON ingredient_scores(overall_score DESC);  -- For rankings

-- predictions table
CREATE INDEX idx_predictions_user_id ON predictions(user_id);  -- Exists
CREATE INDEX idx_predictions_user_date ON predictions(user_id, predicted_date DESC);  -- For history
CREATE INDEX idx_predictions_created ON predictions(created_at DESC);  -- For recent predictions
```

### Query Optimization Patterns

```sql
-- Common Query 1: Get user's recent logs
-- Without index: Full table scan
-- With idx_user_logs_user_date: Index scan

SELECT * FROM user_logs
WHERE user_id = ?
ORDER BY date DESC
LIMIT 30;

-- Common Query 2: Get logs for ML training (last 90 days)
-- Requires: idx_user_logs_user_date

SELECT * FROM user_logs
WHERE user_id = ? AND date >= (CURRENT_DATE - INTERVAL '90 days')
ORDER BY date;

-- Common Query 3: Check ingredient cache
-- Uses: idx_ingredient_scores_name (unique)

SELECT * FROM ingredient_scores
WHERE ingredient_name = ?;

-- Common Query 4: Get all user predictions
-- Uses: idx_predictions_user_date

SELECT * FROM predictions
WHERE user_id = ?
ORDER BY predicted_date DESC;
```

### Estimated Data Volumes (1K Users, 100 Logs Each)

```
+-------------------+------------+---------------+-------------------+
| Table             | Rows       | Avg Row Size  | Total Size        |
+-------------------+------------+---------------+-------------------+
| users             | 1,000      | 200 bytes     | ~200 KB           |
| user_logs         | 100,000    | 500 bytes     | ~50 MB            |
| ingredient_scores | 10,000     | 800 bytes     | ~8 MB             |
| predictions       | 50,000     | 400 bytes     | ~20 MB            |
+-------------------+------------+---------------+-------------------+
| TOTAL             |            |               | ~78 MB            |
+-------------------+------------+---------------+-------------------+
```

This is well within single-server PostgreSQL capabilities. No sharding needed.

---

## API Response Time Optimization

### Target Latencies

```
+-------------------+------------------+------------------+
| Endpoint          | Target (P50)     | Target (P99)     |
+-------------------+------------------+------------------+
| GET /health       | < 10ms           | < 50ms           |
| GET /ingredient/* | < 100ms (cached) | < 2000ms (miss)  |
| GET /logs         | < 100ms          | < 500ms          |
| POST /logs        | < 200ms          | < 500ms          |
| GET /predictions  | < 100ms          | < 500ms          |
| POST /predictions | < 500ms          | < 2000ms         |
| GET /insights     | < 200ms (cached) | < 5000ms (miss)  |
+-------------------+------------------+------------------+
```

### Optimization Strategies

**1. Database Query Optimization**
```python
# BAD: N+1 queries
logs = db.query(UserLog).filter(user_id=user_id).all()
for log in logs:
    user = log.user  # Lazy load

# GOOD: Eager loading
logs = db.query(UserLog).options(
    joinedload(UserLog.user)
).filter(UserLog.user_id == user_id).all()
```

**2. Response Compression**
```python
from fastapi import FastAPI
from starlette.middleware.gzip import GZipMiddleware

app = FastAPI()
app.add_middleware(GZipMiddleware, minimum_size=1000)
```

**3. Async Database Operations**
```python
# Use async SQLAlchemy for better concurrency
from sqlalchemy.ext.asyncio import AsyncSession

async def get_logs(user_id: UUID, db: AsyncSession):
    result = await db.execute(
        select(UserLog).where(UserLog.user_id == user_id)
    )
    return result.scalars().all()
```

**4. Connection Pooling**
```python
# Already configured in database.py
engine = create_engine(
    DATABASE_URL,
    pool_pre_ping=True,
    pool_size=5,
    max_overflow=10
)
```

**5. Pagination for Large Results**
```python
@router.get("/logs")
async def get_logs(
    page: int = 1,
    page_size: int = 20,
    db: Session = Depends(get_db)
):
    offset = (page - 1) * page_size
    logs = db.query(UserLog).filter(
        UserLog.user_id == current_user.id
    ).order_by(
        UserLog.date.desc()
    ).offset(offset).limit(page_size).all()

    return {
        "data": logs,
        "page": page,
        "page_size": page_size,
        "has_more": len(logs) == page_size
    }
```

---

## Scalability Considerations

### Current Scale (MVP)

```
Users: 1,000
Logs per user: 100
Total logs: 100,000
Concurrent requests: ~10
Daily API calls: ~10,000
```

**Architecture:** Single server, SQLite/PostgreSQL, in-memory caching

### Medium Scale (Growth Phase)

```
Users: 10,000
Logs per user: 200
Total logs: 2,000,000
Concurrent requests: ~100
Daily API calls: ~100,000
```

**Architecture Changes:**
1. Add Redis for caching (separate from app server)
2. Move to PostgreSQL if still on SQLite
3. Add Celery workers for background jobs
4. Consider read replicas for database

### Large Scale (Future)

```
Users: 100,000+
Logs per user: 300+
Total logs: 30,000,000+
Concurrent requests: ~1,000
Daily API calls: ~1,000,000
```

**Architecture Changes:**
1. Kubernetes deployment with horizontal scaling
2. Database sharding by user_id
3. Separate ML inference service
4. CDN for static assets
5. Event-driven architecture for real-time features

### Horizontal Scaling Strategy

```
                           +------------------+
                           |   Load Balancer  |
                           +------------------+
                                    |
              +---------------------+---------------------+
              |                     |                     |
       +------v------+       +------v------+       +------v------+
       |  API Pod 1  |       |  API Pod 2  |       |  API Pod N  |
       +-------------+       +-------------+       +-------------+
              |                     |                     |
              +----------+----------+----------+----------+
                         |                     |
                  +------v------+       +------v------+
                  |   Redis     |       | PostgreSQL  |
                  |   Cluster   |       |   Primary   |
                  +-------------+       +-------------+
                                              |
                                       +------v------+
                                       | PostgreSQL  |
                                       |   Replica   |
                                       +-------------+
```

---

## Technical Tradeoffs

### Decision 1: Rule-Based vs ML-Based Ingredient Scoring

| Aspect           | Rule-Based                    | ML-Based                      |
|------------------|-------------------------------|-------------------------------|
| Interpretability | High - clear rules            | Low - black box               |
| Maintenance      | Manual rule updates           | Requires training data        |
| Accuracy         | Good for known patterns       | Better for complex patterns   |
| Cold Start       | Works immediately             | Needs training data           |

**Decision:** Rule-based for MVP, with optional ML enhancement later.

**Rationale:**
- Health claims need interpretability for user trust
- Rules can encode expert nutritional knowledge
- Easier to validate and audit
- ML can be layered on top for edge cases

---

### Decision 2: Per-User Models vs Global Model with User Features

| Aspect            | Per-User Models              | Global Model                  |
|-------------------|------------------------------|-------------------------------|
| Personalization   | Maximum - fully individual   | Good - via user features      |
| Data Efficiency   | Poor - needs per-user data   | Good - pools all data         |
| Compute Cost      | O(n) models for n users      | O(1) model                    |
| Privacy           | Data stays isolated          | Cross-user data mixing        |
| Cold Start        | Bad - needs 14+ logs         | Better - can predict for new  |

**Decision:** Per-user models with cold start fallback.

**Rationale:**
- Privacy is paramount for health data
- Individual variation in food response is high
- Cold start solved via rule-based fallback
- Compute cost acceptable at current scale

---

### Decision 3: Synchronous vs Asynchronous API Design

| Aspect            | Synchronous                  | Asynchronous (Webhooks)       |
|-------------------|------------------------------|-------------------------------|
| Complexity        | Simple                       | Complex callback handling     |
| User Experience   | Wait for response            | Immediate ack, later result   |
| Timeouts          | Risk of timeout for slow ops | No timeout issues             |
| Implementation    | Standard REST                | Requires webhook infrastructure|

**Decision:** Synchronous with smart caching, async for retraining.

**Rationale:**
- Most operations complete within 2s with caching
- ML predictions use cached models (fast)
- Only retraining is truly slow (background job)
- Simpler frontend integration

---

### Decision 4: SQLite vs PostgreSQL for Development

| Aspect            | SQLite                       | PostgreSQL                    |
|-------------------|------------------------------|-------------------------------|
| Setup             | Zero configuration           | Requires installation         |
| Features          | Limited JSON, no arrays      | Full JSON, arrays, GIN index  |
| Concurrency       | Single writer                | Full MVCC                     |
| Production Parity | Different from prod          | Same as production            |

**Decision:** Support both, default SQLite for dev.

**Rationale:**
- SQLite enables zero-config local development
- Already implemented TypeDecorators for compatibility
- Easy switch to PostgreSQL via DATABASE_URL
- Developers can choose based on preference

---

## Security Considerations

### Data Protection

```
1. USER_DATA_ISOLATION
   - All queries include user_id filter
   - No cross-user data access paths
   - ML models stored per-user

2. ENCRYPTION
   - Passwords: bcrypt with work factor 12
   - JWT tokens: HS256 with rotating secrets
   - Database: Encryption at rest (PostgreSQL)
   - Transport: HTTPS only

3. INPUT_VALIDATION
   - Pydantic models for all inputs
   - SQL injection prevented via ORM
   - XSS prevented via React escaping

4. RATE_LIMITING
   - Per-user: 60 req/min
   - Per-IP: 100 req/min (unauthenticated)
   - Login attempts: 5 per minute
```

### Health Data Compliance

```
While not yet HIPAA-compliant, design supports future compliance:

- Audit logging capability (add middleware)
- Data isolation architecture
- No third-party data sharing
- User data export capability
- User data deletion capability
```

---

## Future Considerations

### Phase 2 Enhancements

1. **Real-time Notifications**
   - WebSocket support for live updates
   - Push notifications for predictions

2. **Social Features**
   - Anonymous aggregate insights ("75% of users with similar patterns...")
   - Optional data sharing for research

3. **Advanced ML**
   - Time series forecasting for symptom trends
   - Neural networks for complex pattern recognition
   - Federated learning for privacy-preserving model improvement

4. **Integrations**
   - Wearable data import (sleep, heart rate)
   - Period tracking app sync
   - Grocery list generation

### Technical Debt to Address

1. **Async Database Layer**
   - Current: Sync SQLAlchemy
   - Target: Async SQLAlchemy with asyncpg

2. **Structured Logging**
   - Add correlation IDs
   - Implement distributed tracing

3. **Configuration Management**
   - Move to external config service
   - Feature flags for gradual rollout

4. **Testing Infrastructure**
   - Add integration tests
   - Load testing with Locust
   - Chaos engineering for resilience

---

## Implementation Roadmap

### Sprint 1: Foundation (Week 1-2)

```
[ ] Implement IngredientDataFetcher
    [ ] Open Food Facts API integration
    [ ] USDA API integration
    [ ] Data merging logic
    [ ] In-memory caching

[ ] Implement IngredientScorer
    [ ] Blood sugar scoring rules
    [ ] Inflammation scoring rules
    [ ] Gut impact scoring rules
    [ ] Hormonal relevance logic
    [ ] Overall score calculation
```

### Sprint 2: ML Pipeline (Week 3-4)

```
[ ] Implement MLPredictor
    [ ] Feature engineering pipeline
    [ ] Model training logic
    [ ] Model persistence (joblib)
    [ ] Cold start predictor
    [ ] Prediction confidence

[ ] Background Jobs
    [ ] Celery setup (or BackgroundTasks)
    [ ] Retraining scheduler
    [ ] Cache invalidation
```

### Sprint 3: Insights & Polish (Week 5-6)

```
[ ] Implement InsightEngine
    [ ] Trigger identification
    [ ] Correlation analysis
    [ ] Lag effect analysis
    [ ] Recommendation generation

[ ] Production Readiness
    [ ] Redis integration
    [ ] Rate limiting
    [ ] Comprehensive testing
    [ ] Documentation
```

---

## Appendix A: Environment Variables

```bash
# Required
DATABASE_URL=postgresql://user:pass@localhost:5432/aurea
JWT_SECRET=your-256-bit-secret-key-here

# External APIs
USDA_API_KEY=your-usda-api-key
# Open Food Facts: No key required

# Optional
REDIS_URL=redis://localhost:6379/0
ENVIRONMENT=development|staging|production
DEBUG=true|false
CORS_ORIGINS=["http://localhost:5173"]
RATE_LIMIT_PER_MINUTE=60
```

---

## Appendix B: API Endpoint Summary

```
Auth:
  POST /auth/signup     - Register new user
  POST /auth/login      - Login, get JWT

Ingredients:
  GET /ingredient/{name} - Get health scores

Logs:
  POST /logs            - Create/update daily log
  GET /logs             - List user's logs
  GET /logs/{date}      - Get specific log
  DELETE /logs/{id}     - Delete log

Predictions:
  POST /predictions     - Request symptom prediction
  GET /predictions      - List prediction history

Insights:
  GET /insights         - Get personalized insights

Health:
  GET /health           - Service health check
```

---

## Appendix C: Data Models

```python
# Core entities (from database.py)

User:
  id: UUID
  email: str (unique)
  password_hash: str
  created_at: datetime

UserLog:
  id: UUID
  user_id: UUID (FK -> User)
  date: date
  ingredients: List[str]
  symptoms: Dict[str, int]  # {"bloating": 3, "energy": 4, ...}
  cycle_phase: Optional[str]

IngredientScore:
  id: UUID
  ingredient_name: str (unique)
  blood_sugar_impact: int (0-100)
  inflammation_potential: int (0-100)
  gut_impact: int (0-100)
  overall_score: int (0-100)
  hormonal_relevance: Dict
  evidence_confidence: str
  sources: List[Dict]

Prediction:
  id: UUID
  user_id: UUID (FK -> User)
  predicted_date: date
  ingredients: List[str]
  cycle_phase: Optional[str]
  predicted_bloating_probability: float
  predicted_symptoms: Dict[str, float]
  confidence: str
  interpretation: str
```

---

## References

- Open Food Facts API: https://wiki.openfoodfacts.org/API
- USDA FoodData Central: https://fdc.nal.usda.gov/api-guide.html
- FastAPI Documentation: https://fastapi.tiangolo.com/
- SQLAlchemy 2.0: https://docs.sqlalchemy.org/en/20/
- scikit-learn User Guide: https://scikit-learn.org/stable/user_guide.html
- Redis Caching Patterns: https://redis.io/docs/manual/patterns/

---

**Document Version:** 1.0
**Last Updated:** 2026-01-20
**Author:** System Architect
