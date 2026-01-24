# AUREA - Product Requirements Document (PRD)
## Personal Ingredient & Symptom Predictor Platform

**Version:** 1.0  
**Last Updated:** January 2026  
**Status:** MVP Development  
**Timeline:** 2 months (Weeks 1-8)  
**Team:** Solo Developer + Claude Code Scaffolding  

---

## Table of Contents

1. [Executive Summary](#executive-summary)
2. [Product Vision & Goals](#product-vision--goals)
3. [User Personas](#user-personas)
4. [Core Problem & Solution](#core-problem--solution)
5. [Product Features (MVP)](#product-features-mvp)
6. [Technical Architecture](#technical-architecture)
7. [Data Models & Schema](#data-models--schema)
8. [API Specifications](#api-specifications)
9. [Frontend Specifications](#frontend-specifications)
10. [Backend Specifications](#backend-specifications)
11. [Data Science Implementation](#data-science-implementation)
12. [Deployment & DevOps](#deployment--devops)
13. [Success Metrics](#success-metrics)
14. [8-Week Timeline](#8-week-timeline)
15. [Risk Assessment](#risk-assessment)
16. [Future Roadmap (Post-MVP)](#future-roadmap-post-mvp)

---

## Executive Summary

**Aurea** is a personal health prediction platform that helps users understand how specific ingredients affect their individual health outcomes. Unlike generic nutrition apps, Aurea builds personalized predictive models for each user by:

1. Logging what they eat (ingredient-level)
2. Logging how they feel (daily symptoms)
3. Finding correlations between ingredients and outcomes
4. Predicting future symptoms based on ingredient choices

**Core Value Proposition:**
- Users discover their unique ingredient triggers (not generic health advice)
- App learns over time as they log more data
- Personalized insights powered by their own data
- Menstrual cycle awareness for hormonal health tracking

**Target User:** Health-conscious teens/young adults (16-25) interested in understanding their body's responses to food.

**MVP Launch:** End of Week 8
- Public beta: 5-10 users
- Core features: ingredient search, daily logger, basic predictions
- Data science: correlation analysis + simple ML models

---

## Product Vision & Goals

### Vision Statement
*"Empower users to understand their body's unique responses to food through data-driven personalization, not generic health claims."*

### Core Goals (MVP Phase)

| Goal | Success Metric | Target |
|------|---|---|
| Data Collection | Users logging consistently | 70% retention after 3 weeks |
| Prediction Accuracy | Model predicts symptom outcomes | >60% accuracy after 4 weeks data |
| User Engagement | Daily active usage | 5+ logs per user per week |
| Data Quality | Clean, valid logging patterns | <5% invalid entries |
| Time to Insight | Users see first insights | Within 2 weeks of logging |

### Long-term Vision (Post-MVP)
- 10,000+ users logging ingredient data
- Research-grade dataset of ingredient-symptom correlations
- Published findings on personalized nutrition
- AI-powered dietary recommendations
- Integration with wearables (Apple Health, Oura Ring)
- Community insights (anonymized trend reports)

---

## User Personas

### Persona 1: Alex (The Data-Curious Teenager)
- **Age:** 17, high school junior
- **Background:** Interested in health optimization, amateur data scientist
- **Pain Point:** "I feel bloated after certain foods, but I don't know which ones"
- **Goal:** Discover personal food triggers using data
- **Tech Comfort:** High (uses Python, comfortable with data)
- **Motivation:** School project + genuine interest in health

### Persona 2: Maya (The Health-Conscious Young Adult)
- **Age:** 22, college student
- **Background:** Nutrition-interested, suspects food sensitivities
- **Pain Point:** "Apps tell me sugar is bad, but I want to know if IT is bad for ME"
- **Goal:** Make informed food choices based on personal data
- **Tech Comfort:** Medium (comfort with mobile apps, not technical)
- **Motivation:** Better energy + understanding own body

### Persona 3: Jordan (The Hormonal Health Tracker)
- **Age:** 20, student with PCOS concerns
- **Background:** Interested in cycle-based nutrition
- **Pain Point:** "My symptoms change throughout my cycle, but apps don't account for this"
- **Goal:** See how ingredients affect energy/mood at different cycle phases
- **Tech Comfort:** Medium-high
- **Motivation:** Manage hormonal symptoms through diet

---

## Core Problem & Solution

### Problem Statement

**Existing Landscape:**
- Fitness apps (MyFitnessPal) track calories but not symptoms
- Nutrition apps rate ingredients universally ("sugar is bad")
- Health trackers (Oura, Whoop) measure outcomes but not triggers
- No app connects ingredient logs → personal health outcomes

**User Frustration:**
- "The nutrition label says X is bad, but I don't actually feel worse after eating it"
- "I feel bloated sometimes but can't figure out which foods cause it"
- "I take the same actions on different cycle phases with different results"

**Gap in Market:**
- No personalized predictive model for individual users
- No correlation analysis between what they eat and how they feel
- No menstrual cycle awareness in health tracking

### Solution: Aurea

**Three-Layer System:**

1. **Ingredient Database Layer**
   - Curated ingredient health properties (blood sugar, inflammation, gut, hormonal)
   - Sourced from Open Food Facts + USDA + research
   - Scored by health impact category

2. **Personal Data Collection Layer**
   - Users log ingredients eaten daily
   - Users log symptoms daily (5 metrics)
   - Optional: menstrual cycle phase
   - Clean, validated data entry

3. **Predictive Intelligence Layer**
   - Trains personal model on user's own data
   - Identifies ingredient-symptom correlations
   - Predicts: "If you eat X, probability of symptom Y = 72%"
   - Shows confidence levels (emerging vs strong pattern)

**Key Differentiator:** Predictions are based on *their own data*, not population averages.

---

## Product Features (MVP)

### Feature 1: Ingredient Search & Health Scoring
**Status:** Core MVP Feature

**User Flow:**
1. User opens app → "Search ingredients"
2. Types ingredient name (e.g., "emulsifier", "high fructose corn syrup")
3. App displays:
   - Overall risk score (0-100)
   - Category breakdown:
     * Blood sugar impact (0-100)
     * Inflammation potential (0-100)
     * Gut impact (0-100)
     * Hormonal relevance (yes/no + mechanism)
   - Evidence confidence (strong/mixed/emerging)
   - Source citations

**Display:**
```
EMULSIFIER (Polysorbate 80)

Overall Risk Score: 35/100

Blood Sugar Impact: 70/100 (unlikely to spike)
Inflammation Potential: 25/100 (linked to inflammatory responses)
Gut Impact: 40/100 (may cause discomfort in sensitive individuals)
Hormonal Relevance: Possible estrogen-mimic properties (emerging research)

Evidence Confidence: Mixed

Sources: 3 peer-reviewed studies, 1 epidemiological survey
```

**Requirements:**
- [✓] Search bar with autocomplete (500+ common ingredients)
- [✓] Display scores in visual format (progress bars or gauges)
- [✓] Show breakdown for each category
- [✓] Include disclaimer: "Not medical advice"
- [✓] Cache results (avoid repeated API calls)
- [✓] Fast load (<1 second per search)

---

### Feature 2: Daily Symptom Logger
**Status:** Core MVP Feature

**User Flow:**
1. User opens app → "Log today"
2. Logs 5 symptoms on 0-5 scale:
   - Energy level
   - Bloating
   - Focus/mental clarity
   - Mood/emotional stability
   - Sleep quality
3. Searches and selects ingredients eaten that day
4. (Optional) Selects menstrual cycle phase
5. Submits → saved to profile

**Display:**
```
TODAY'S LOG - January 20, 2026

SYMPTOMS (slide to rate):
Energy: ▓▓▓▓░ (4/5)
Bloating: ▓░░░░ (1/5)
Focus: ▓▓▓▓▓ (5/5)
Mood: ▓▓▓░░ (3/5)
Sleep Quality: ▓▓▓▓░ (4/5)

FOODS EATEN:
[Search box] Add ingredient...
• White rice
• Chicken breast
• Vegetable oil
• Salt

CYCLE PHASE (optional):
○ Menstruation  ○ Follicular  ◉ Ovulation  ○ Luteal

[SAVE] [CANCEL]
```

**Requirements:**
- [✓] 5 symptom sliders (0-5 scale)
- [✓] Food ingredient search (autocomplete)
- [✓] Add/remove ingredients from list
- [✓] Save with timestamp
- [✓] Edit previous logs (within 24 hours)
- [✓] Confirmation before submit
- [✓] Mobile-responsive (designed for phone)

---

### Feature 3: Personal Predictions
**Status:** Core MVP Feature (Requires 2+ weeks data)

**When Available:** After user has 7+ days of logged data

**User Flow:**
1. User about to eat something
2. Goes to "Will this spike my bloating?" section
3. Enters ingredients they plan to eat
4. App shows prediction:
   - Probability of symptom (0-100%)
   - Confidence level (low/medium/high)
   - Natural language interpretation

**Display:**
```
PREDICTION ENGINE
(Available after 7+ days of logging)

IF YOU EAT THIS TODAY:
[Search ingredients...] 
• White bread
• Butter
• Cheese

PREDICTION:
Bloating Probability: 68%
Confidence: Medium (observed 3x)

Interpretation:
"Based on your history, when you eat this combination, 
you experience bloating 68% of the time, typically within 
6-12 hours."

[SAVE THIS COMBINATION] [CLEAR]
```

**Requirements:**
- [✓] Requires minimum 7 days logged data
- [✓] Shows probability as percentage
- [✓] Displays confidence level
- [✓] Explains reasoning (natural language)
- [✓] Allows users to save predicted combinations
- [✓] Updates model weekly as new data arrives

---

### Feature 4: Personal Insights Dashboard
**Status:** Core MVP Feature (Requires 3+ weeks data)

**When Available:** After user has 21+ days of logged data

**Sections:**

**A. Top Triggers**
```
YOUR TOP TRIGGERS
(Based on your data)

🔴 Emulsifiers → Bloating
Correlation: 0.72 | Observed: 5x
"When you eat foods with emulsifiers, you report 
bloating 72% of the time."

🟡 Refined carbs → Energy dip
Correlation: 0.64 | Observed: 4x
"You tend to feel less energetic 4-6 hours after 
eating refined carbohydrates."

🟢 Raw vegetables → Good focus
Correlation: 0.58 | Observed: 3x
"Meals with raw vegetables correlate with 
better focus in the afternoon."
```

**B. Cycle Phase Analysis** (if cycle data logged)
```
YOUR CYCLE PATTERNS
(Follicular vs Luteal)

Energy Levels:
Follicular: 4.2/5 (avg)
Luteal: 3.1/5 (avg)
Difference: -1.1 (25% lower in luteal phase)

Bloating:
Follicular: 1.8/5
Luteal: 3.4/5
Difference: +1.6 (88% higher in luteal phase)

Cravings:
Follicular: Sugar cravings ↓
Luteal: Sugar cravings ↑ 40%
```

**C. Lag Analysis**
```
SYMPTOM TIMING
(When do symptoms appear after eating?)

Emulsifiers:
Peak bloating: 6-12 hours after eating
Secondary peak: 24+ hours

High sugar:
Energy dip: 2-4 hours after eating
Recovery: 6-8 hours

Caffeine:
Sleep impact: 12+ hours after eating
(Most noticeable if eaten after 2pm)
```

**Requirements:**
- [✓] Only show when sufficient data (21+ days)
- [✓] Display top 3-5 triggers
- [✓] Show correlation strength (0-1 scale)
- [✓] Show observation count (how many times seen)
- [✓] Include natural language interpretation
- [✓] Cycle phase analysis (if data exists)
- [✓] Lag analysis (when symptoms appear)
- [✓] Update weekly as new data arrives

---

### Feature 5: Authentication & User Profiles
**Status:** Core MVP Feature

**Requirements:**
- [✓] Email/password signup
- [✓] Email/password login
- [✓] Logout
- [✓] Profile page (edit preferences)
- [✓] JWT token-based auth
- [✓] Password requirements (8+ chars, 1 number)
- [✓] Session persistence (remember for 30 days)

---

### Feature 6: Data Visualization
**Status:** Supporting MVP Feature

**Charts:**
1. **Weekly Symptom Trends**
   - Line chart: Energy, bloating, mood over 4 weeks
   - User can click to see what they ate on high/low days

2. **Ingredient Frequency**
   - Bar chart: Most logged ingredients
   - Color-coded by health score

3. **Symptom Correlation Matrix**
   - Heatmap: Which ingredient categories correlate with which symptoms
   - Visual way to see patterns

**Requirements:**
- [✓] Interactive charts (hover for details)
- [✓] Mobile-responsive
- [✓] Export as image/PDF (week 5+)

---

## Technical Architecture

### System Overview

```
┌─────────────────────────────────────────────────────────────┐
│                     AUREA PLATFORM                          │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│  ┌──────────────────┐                ┌──────────────────┐   │
│  │   FRONTEND       │                │   BACKEND        │   │
│  │   (React/Vite)   │◄──────────────►│   (FastAPI)      │   │
│  │                  │   REST API     │                  │   │
│  │  - UI Components │   + JWT Auth   │  - Routes        │   │
│  │  - Forms         │                │  - Auth          │   │
│  │  - Charts        │                │  - Business Logic│   │
│  │  - Dashboard     │                │                  │   │
│  └──────────────────┘                └──────────────────┘   │
│         │ (https://aurea.onrender.com)       │               │
│         │ Deployed: Render Static Site       │               │
│         │                        Deployed: Render Web Service│
│         │                                                     │
│         └──────────────┬──────────────────────────────────┘   │
│                        │                                       │
│         ┌──────────────▼──────────────┐                       │
│         │   DATA LAYER               │                       │
│         ├────────────────────────────┤                       │
│         │                            │                       │
│         │  ┌────────────────────┐   │                       │
│         │  │  PostgreSQL DB     │   │                       │
│         │  │  (Render)          │   │                       │
│         │  │                    │   │                       │
│         │  │ - Users            │   │                       │
│         │  │ - User Logs        │   │                       │
│         │  │ - Ingredient Cache │   │                       │
│         │  │ - Predictions      │   │                       │
│         │  │ - Models (pickled) │   │                       │
│         │  └────────────────────┘   │                       │
│         │                            │                       │
│         │  ┌────────────────────┐   │                       │
│         │  │  External APIs     │   │                       │
│         │  │                    │   │                       │
│         │  │ - Open Food Facts  │   │                       │
│         │  │ - USDA FoodData    │   │                       │
│         │  │ - (Future: Edamam) │   │                       │
│         │  └────────────────────┘   │                       │
│         │                            │                       │
│         └────────────────────────────┘                       │
│                                                               │
└─────────────────────────────────────────────────────────────┘

CORE COMPUTE LAYER (Your Data Science Code - Python):
┌──────────────────────────────────────────────────────────────┐
│ app/services/                                                │
│  ├─ api_wrapper.py          → Multi-API aggregation         │
│  ├─ ingredient_scorer.py    → Health scoring logic           │
│  ├─ ml_predictor.py         → Per-user ML models            │
│  └─ analysis_engine.py      → Correlation & insights        │
│                                                              │
│ tasks/                                                       │
│  └─ daily_retrain.py        → Model retraining job          │
│                                                              │
│ notebooks/                                                   │
│  ├─ eda.ipynb               → Exploratory analysis          │
│  └─ model_testing.ipynb     → Model validation              │
└──────────────────────────────────────────────────────────────┘
```

### Technology Stack

| Layer | Technology | Version | Rationale |
|-------|-----------|---------|-----------|
| **Frontend** | React 18 | 18.x | Modern, component-based, large ecosystem |
| | Vite | 5.x | Fast bundler, instant HMR |
| | Tailwind CSS | 3.x | Utility-first, rapid UI development |
| | Shadcn/ui | Latest | Pre-built accessible components |
| | TanStack Query | 5.x | Server state management |
| | Zustand | 4.x | Lightweight global state |
| | Axios | 1.x | HTTP client |
| | React Router | 6.x | Client-side routing |
| **Backend** | FastAPI | 0.104.x | Modern, async, auto-generated docs |
| | Uvicorn | 0.24.x | ASGI server |
| | SQLAlchemy | 2.x | ORM, type-safe queries |
| | Pydantic | 2.x | Data validation |
| | PostgreSQL | 15 | Relational DB, JSONB support |
| | Alembic | 1.x | Database migrations |
| | PyJWT | 2.x | JWT token generation |
| **Data Science** | Pandas | 2.x | Data manipulation |
| | NumPy | 1.x | Numerical computing |
| | Scikit-learn | 1.x | ML models (v1) |
| | SciPy | 1.x | Statistical analysis |
| | Jupyter | Latest | Interactive development |
| **DevOps** | Git/GitHub | N/A | Version control |
| | Render.com | N/A | Hosting (free tier) |
| | Docker | Optional | Containerization (future) |

---

## Data Models & Schema

### Database Schema (PostgreSQL)

```sql
-- USERS TABLE
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    bio TEXT,
    profile_picture_url VARCHAR(500),
    cycle_enabled BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- USER LOGS (Daily entries)
CREATE TABLE user_logs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    log_date DATE NOT NULL,
    
    -- Symptoms logged (0-5 scale)
    energy_level INT CHECK (energy_level >= 0 AND energy_level <= 5),
    bloating INT CHECK (bloating >= 0 AND bloating <= 5),
    focus INT CHECK (focus >= 0 AND focus <= 5),
    mood INT CHECK (mood >= 0 AND mood <= 5),
    sleep_quality INT CHECK (sleep_quality >= 0 AND sleep_quality <= 5),
    
    -- Foods eaten that day (JSON array of ingredient names)
    ingredients JSONB NOT NULL DEFAULT '[]',
    
    -- Optional menstrual cycle phase
    cycle_phase VARCHAR(50), -- 'menstruation', 'follicular', 'ovulation', 'luteal'
    
    -- Optional notes
    notes TEXT,
    
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    
    CONSTRAINT unique_user_date UNIQUE (user_id, log_date)
);

-- INGREDIENT SCORES (Cached from APIs)
CREATE TABLE ingredient_scores (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    ingredient_name VARCHAR(255) UNIQUE NOT NULL,
    
    -- Health scores (0-100, where applicable)
    blood_sugar_impact INT CHECK (blood_sugar_impact >= 0 AND blood_sugar_impact <= 100),
    inflammation_potential INT CHECK (inflammation_potential >= 0 AND inflammation_potential <= 100),
    gut_impact INT CHECK (gut_impact >= 0 AND gut_impact <= 100),
    
    -- Hormonal relevance
    hormonal_relevance JSONB, -- {"mechanisms": ["insulin_spiking"], "confidence": "strong"}
    
    -- Evidence quality
    evidence_confidence VARCHAR(50), -- 'strong', 'mixed', 'emerging'
    
    -- Sources
    sources JSONB, -- [{"title": "...", "url": "...", "year": 2024}, ...]
    
    -- API data (raw)
    open_food_facts_data JSONB,
    usda_data JSONB,
    
    cached_at TIMESTAMP DEFAULT NOW(),
    UNIQUE (ingredient_name)
);

-- USER PREDICTIONS (Model outputs)
CREATE TABLE user_predictions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    
    predicted_for_date DATE NOT NULL,
    ingredients JSONB NOT NULL DEFAULT '[]', -- What they plan to eat
    cycle_phase VARCHAR(50),
    
    -- Prediction outputs
    bloating_probability FLOAT CHECK (bloating_probability >= 0 AND bloating_probability <= 1),
    energy_probability FLOAT CHECK (energy_probability >= 0 AND energy_probability <= 1),
    
    -- Confidence
    confidence_level VARCHAR(50), -- 'low', 'medium', 'high'
    
    -- Actual vs predicted (filled in after they log)
    actual_bloating INT,
    actual_energy INT,
    prediction_correct BOOLEAN,
    
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- USER INSIGHTS (Cached correlations)
CREATE TABLE user_insights (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    
    -- Insight type
    insight_type VARCHAR(50), -- 'trigger', 'lag_effect', 'cycle_difference'
    
    -- Content
    ingredient_name VARCHAR(255),
    symptom_name VARCHAR(50), -- 'bloating', 'energy', etc.
    correlation_strength FLOAT, -- 0-1
    observation_count INT, -- How many times observed
    p_value FLOAT, -- Statistical significance
    confidence_level VARCHAR(50),
    
    -- Interpretation
    interpretation TEXT, -- Natural language explanation
    
    lag_hours INT, -- If applicable: how many hours after eating
    
    -- Cycle-specific (if applicable)
    cycle_phase VARCHAR(50),
    
    created_at TIMESTAMP DEFAULT NOW(),
    expires_at TIMESTAMP, -- Insights expire after 30 days of no new data
    
    UNIQUE (user_id, insight_type, ingredient_name, symptom_name, cycle_phase)
);

-- INDEXES (For performance)
CREATE INDEX idx_user_logs_user_id ON user_logs(user_id);
CREATE INDEX idx_user_logs_log_date ON user_logs(log_date);
CREATE INDEX idx_user_insights_user_id ON user_insights(user_id);
CREATE INDEX idx_ingredient_scores_name ON ingredient_scores(ingredient_name);
```

### Data Models (Pydantic/Python)

```python
# User Model
class UserBase(BaseModel):
    email: str
    name: str

class UserCreate(UserBase):
    password: str

class UserLogin(BaseModel):
    email: str
    password: str

class User(UserBase):
    id: UUID
    created_at: datetime
    cycle_enabled: bool

class UserResponse(User):
    pass

# Daily Log Model
class SymptomScores(BaseModel):
    energy_level: int  # 0-5
    bloating: int
    focus: int
    mood: int
    sleep_quality: int

class UserLogCreate(BaseModel):
    log_date: date
    symptoms: SymptomScores
    ingredients: list[str]
    cycle_phase: Optional[str] = None  # menstruation, follicular, ovulation, luteal
    notes: Optional[str] = None

class UserLogResponse(UserLogCreate):
    id: UUID
    user_id: UUID
    created_at: datetime
    updated_at: datetime

# Ingredient Model
class IngredientScore(BaseModel):
    ingredient_name: str
    blood_sugar_impact: int  # 0-100
    inflammation_potential: int
    gut_impact: int
    hormonal_relevance: list[str]
    evidence_confidence: str  # strong, mixed, emerging
    sources: list[dict]

class IngredientSearchResponse(IngredientScore):
    id: UUID
    cached_at: datetime

# Prediction Model
class PredictionInput(BaseModel):
    ingredients: list[str]
    cycle_phase: Optional[str] = None

class PredictionOutput(BaseModel):
    bloating_probability: float  # 0-1
    confidence_level: str
    interpretation: str
    lag_hours: Optional[int] = None

# Insights Model
class Trigger(BaseModel):
    ingredient_name: str
    symptom_name: str
    correlation_strength: float
    observation_count: int
    confidence_level: str
    interpretation: str

class CycleAnalysis(BaseModel):
    phase: str
    avg_energy: float
    avg_bloating: float
    avg_mood: float
    days_logged: int

class LagEffect(BaseModel):
    ingredient_name: str
    lag_hours: int
    mean_symptom_at_lag: float
    observations: int

class InsightsResponse(BaseModel):
    top_triggers: list[Trigger]
    cycle_analysis: Optional[dict[str, CycleAnalysis]] = None
    lag_effects: Optional[dict[str, list[LagEffect]]] = None
    overall_confidence: str
    recommendation: str
```

---

## API Specifications

### Base URL
- **Production:** `https://api.aurea.onrender.com`
- **Development:** `http://localhost:8000`
- **Documentation:** `{base_url}/docs` (Swagger UI)

### Authentication
- **Method:** JWT (Bearer token)
- **Token Location:** `Authorization: Bearer {token}`
- **Token Expiry:** 30 days
- **Refresh:** Re-login to get new token

---

### Authentication Endpoints

#### POST /auth/signup
Register a new user.

**Request:**
```json
{
    "email": "user@example.com",
    "name": "Maya Chen",
    "password": "SecurePassword123"
}
```

**Response (201):**
```json
{
    "user_id": "550e8400-e29b-41d4-a716-446655440000",
    "email": "user@example.com",
    "name": "Maya Chen",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "created_at": "2026-01-20T10:30:00Z"
}
```

**Errors:**
- 400: Email already exists
- 400: Password too weak
- 422: Invalid email format

---

#### POST /auth/login
Authenticate user and get JWT token.

**Request:**
```json
{
    "email": "user@example.com",
    "password": "SecurePassword123"
}
```

**Response (200):**
```json
{
    "user_id": "550e8400-e29b-41d4-a716-446655440000",
    "email": "user@example.com",
    "name": "Maya Chen",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "expires_in": 2592000
}
```

**Errors:**
- 401: Invalid credentials
- 404: User not found

---

### Ingredient Endpoints

#### GET /ingredient/{name}
Get health scores for an ingredient.

**Parameters:**
- `name` (path): Ingredient name (URL encoded)

**Response (200):**
```json
{
    "id": "650e8400-e29b-41d4-a716-446655440001",
    "ingredient_name": "Emulsifier (Polysorbate 80)",
    "blood_sugar_impact": 70,
    "inflammation_potential": 25,
    "gut_impact": 40,
    "hormonal_relevance": ["possible_estrogen_mimic"],
    "evidence_confidence": "mixed",
    "sources": [
        {
            "title": "Food additives and inflammatory responses",
            "year": 2023,
            "url": "https://example.com/study"
        }
    ],
    "cached_at": "2026-01-10T14:20:00Z"
}
```

**Errors:**
- 404: Ingredient not found
- 429: Rate limit exceeded
- 503: External API unavailable

---

#### GET /ingredient/search?q={query}
Search for ingredients with autocomplete.

**Parameters:**
- `q` (query): Search term (min 2 characters)

**Response (200):**
```json
{
    "results": [
        {
            "ingredient_name": "Emulsifier (Polysorbate 80)",
            "match_score": 0.98
        },
        {
            "ingredient_name": "Soy Lecithin (Emulsifier)",
            "match_score": 0.85
        }
    ]
}
```

---

### Log Endpoints

#### POST /logs (Auth required)
Create a new daily log.

**Request:**
```json
{
    "log_date": "2026-01-20",
    "symptoms": {
        "energy_level": 4,
        "bloating": 2,
        "focus": 5,
        "mood": 3,
        "sleep_quality": 4
    },
    "ingredients": ["white rice", "chicken breast", "vegetable oil"],
    "cycle_phase": "ovulation",
    "notes": "Felt great today, lots of water"
}
```

**Response (201):**
```json
{
    "id": "750e8400-e29b-41d4-a716-446655440002",
    "user_id": "550e8400-e29b-41d4-a716-446655440000",
    "log_date": "2026-01-20",
    "symptoms": {
        "energy_level": 4,
        "bloating": 2,
        "focus": 5,
        "mood": 3,
        "sleep_quality": 4
    },
    "ingredients": ["white rice", "chicken breast", "vegetable oil"],
    "cycle_phase": "ovulation",
    "created_at": "2026-01-20T15:45:00Z"
}
```

**Errors:**
- 401: Unauthorized
- 400: Invalid symptom values (must be 0-5)
- 409: Log already exists for this date

---

#### GET /logs (Auth required)
Get user's log history.

**Parameters:**
- `limit` (query, optional): Number of logs (default: 30, max: 100)
- `offset` (query, optional): Pagination offset (default: 0)
- `start_date` (query, optional): Filter from date (YYYY-MM-DD)
- `end_date` (query, optional): Filter to date (YYYY-MM-DD)

**Response (200):**
```json
{
    "total": 45,
    "logs": [
        {
            "id": "750e8400-e29b-41d4-a716-446655440002",
            "log_date": "2026-01-20",
            "symptoms": {...},
            "ingredients": [...],
            "cycle_phase": "ovulation",
            "created_at": "2026-01-20T15:45:00Z"
        }
    ]
}
```

---

#### GET /logs/{log_id} (Auth required)
Get a specific log.

**Response (200):**
```json
{
    "id": "750e8400-e29b-41d4-a716-446655440002",
    "log_date": "2026-01-20",
    "symptoms": {...},
    "ingredients": [...],
    "cycle_phase": "ovulation",
    "created_at": "2026-01-20T15:45:00Z"
}
```

---

#### PUT /logs/{log_id} (Auth required)
Update a log (within 24 hours of creation).

**Request:**
```json
{
    "symptoms": {
        "energy_level": 3,
        "bloating": 3,
        ...
    },
    "ingredients": ["rice", "chicken", "oil", "broccoli"]
}
```

**Response (200):**
```json
{
    "id": "750e8400-e29b-41d4-a716-446655440002",
    "updated_at": "2026-01-20T16:00:00Z",
    ...
}
```

---

#### DELETE /logs/{log_id} (Auth required)
Delete a log.

**Response (204):** No content

---

### Prediction Endpoints

#### POST /predictions (Auth required)
Get prediction for ingredient combination.

**Requires:** 7+ days of logged data

**Request:**
```json
{
    "ingredients": ["white bread", "butter", "cheese"],
    "cycle_phase": "follicular"
}
```

**Response (200):**
```json
{
    "bloating_probability": 0.68,
    "energy_probability": 0.42,
    "confidence_level": "medium",
    "interpretation": "Based on your history, when you eat this combination, you experience bloating 68% of the time, typically within 6-12 hours.",
    "lag_hours": 8
}
```

**Errors:**
- 400: Insufficient data (need 7+ days)
- 400: Model not yet trained

---

#### GET /predictions (Auth required)
Get recent predictions made.

**Response (200):**
```json
{
    "predictions": [
        {
            "id": "850e8400-e29b-41d4-a716-446655440003",
            "predicted_for_date": "2026-01-20",
            "ingredients": ["white bread", "butter", "cheese"],
            "bloating_probability": 0.68,
            "confidence_level": "medium",
            "created_at": "2026-01-20T10:00:00Z"
        }
    ]
}
```

---

### Insights Endpoints

#### GET /insights (Auth required)
Get personalized insights based on logged data.

**Requires:** 21+ days of logged data

**Response (200):**
```json
{
    "insights_available": true,
    "data_points": 47,
    "top_triggers": [
        {
            "ingredient_name": "Emulsifiers",
            "symptom_name": "bloating",
            "correlation_strength": 0.72,
            "observation_count": 5,
            "confidence_level": "strong",
            "interpretation": "When you eat foods with emulsifiers, you report bloating 72% of the time."
        },
        {
            "ingredient_name": "Refined carbs",
            "symptom_name": "energy",
            "correlation_strength": -0.64,
            "observation_count": 4,
            "confidence_level": "medium",
            "interpretation": "You tend to feel less energetic 4-6 hours after eating refined carbohydrates."
        }
    ],
    "cycle_analysis": {
        "follicular": {
            "avg_energy": 4.2,
            "avg_bloating": 1.8,
            "avg_mood": 4.0,
            "days_logged": 8
        },
        "luteal": {
            "avg_energy": 3.1,
            "avg_bloating": 3.4,
            "avg_mood": 3.2,
            "days_logged": 7
        }
    },
    "lag_analysis": {
        "emulsifiers": [
            {
                "lag_hours": 6,
                "symptom": "bloating",
                "intensity": 3.2
            },
            {
                "lag_hours": 12,
                "symptom": "bloating",
                "intensity": 3.8
            }
        ]
    },
    "overall_confidence": "medium",
    "recommendation": "Continue logging for more reliable patterns. Current insights based on 47 data points."
}
```

**Errors:**
- 400: Insufficient data (need 21+ days)

---

### Health/System Endpoints

#### GET /health
Health check endpoint.

**Response (200):**
```json
{
    "status": "ok",
    "timestamp": "2026-01-20T15:45:00Z",
    "database": "connected",
    "version": "1.0.0"
}
```

---

#### GET /docs
Swagger UI documentation (auto-generated by FastAPI).

---

## Frontend Specifications

### Pages & Routes

```
/                          → Landing page (public)
/signup                    → Sign up form
/login                     → Login form
/dashboard                 → Main dashboard (auth required)
  /dashboard/log           → Daily logger view
  /dashboard/search        → Ingredient search
  /dashboard/predictions   → My predictions
  /dashboard/insights      → Personal insights
  /dashboard/history       → View all logs
  /settings                → User preferences
/404                       → Not found
```

### Landing Page

**Purpose:** Onboard new users, explain value prop

**Sections:**
1. Hero: "Know what your ingredients really do"
2. Features: 3-column layout
   - Icon + heading + description
3. How it works: 4-step flow
   - Step 1: Log ingredients
   - Step 2: Log symptoms
   - Step 3: App finds patterns
   - Step 4: Get predictions
4. Call-to-action buttons: "Sign Up" / "Learn More"
5. Footer: Links, privacy policy

**Design:**
- Clean, minimal aesthetic
- Mobile-first responsive
- Gradient accent colors (teals/blues)
- No heavy animations (fast load)

---

### Dashboard Pages

#### Page: Daily Logger (/dashboard/log)

**Components:**
```
┌─────────────────────────────────────┐
│  AUREA                    [Settings] │
├─────────────────────────────────────┤
│                                     │
│  TODAY'S LOG - January 20, 2026     │
│                                     │
│  SYMPTOMS (drag to rate):           │
│  ┌─────────────────────────────┐   │
│  │ Energy:       ▓▓▓▓░ (4/5)   │   │
│  │ Bloating:     ▓░░░░ (1/5)   │   │
│  │ Focus:        ▓▓▓▓▓ (5/5)   │   │
│  │ Mood:         ▓▓▓░░ (3/5)   │   │
│  │ Sleep:        ▓▓▓▓░ (4/5)   │   │
│  └─────────────────────────────┘   │
│                                     │
│  FOODS EATEN:                       │
│  [Search ingredients...]            │
│  [x] White rice                     │
│  [x] Chicken breast                 │
│  [x] Olive oil                      │
│                                     │
│  CYCLE PHASE (optional):            │
│  ○ Menstruation ○ Follicular       │
│  ◉ Ovulation    ○ Luteal           │
│                                     │
│  NOTES:                             │
│  [Text area for optional notes]     │
│                                     │
│              [SAVE]  [CLEAR]        │
│                                     │
└─────────────────────────────────────┘
```

**Requirements:**
- [✓] Symptoms as 5-point sliders (visual + numeric)
- [✓] Ingredient search with autocomplete (calls `/ingredient/search`)
- [✓] Add/remove ingredients dynamically
- [✓] Cycle phase selector (radio buttons or dropdown)
- [✓] Optional notes text area
- [✓] Date picker (default: today, can select past dates within 24h)
- [✓] Save button submits to `/logs` endpoint
- [✓] Success toast notification
- [✓] Error handling + display
- [✓] Loading state during submission

---

#### Page: Ingredient Search (/dashboard/search)

**Components:**
```
┌──────────────────────────────────┐
│ AUREA              [Back]         │
├──────────────────────────────────┤
│                                  │
│  INGREDIENT SEARCH               │
│                                  │
│  [Search ingredients...]         │
│                                  │
│  ┌─────────────────────────────┐ │
│  │ SUGAR                       │ │
│  │                             │ │
│  │ Overall Risk: ████░ 72/100  │ │
│  │                             │ │
│  │ Blood Sugar: ██░░░ 20/100   │ │
│  │ Inflammation: ███░░ 35/100  │ │
│  │ Gut Impact: █████░ 85/100   │ │
│  │                             │ │
│  │ Hormonal: Insulin spiking   │ │
│  │           (strong evidence) │ │
│  │                             │ │
│  │ Evidence: Mixed             │ │
│  │                             │ │
│  │ Sources: 5 studies          │ │
│  │                             │ │
│  │ [ADD TO TODAY'S LOG]         │ │
│  └─────────────────────────────┘ │
│                                  │
│  ┌─────────────────────────────┐ │
│  │ EMULSIFIER (Polysorbate 80) │ │
│  │ ... (similar layout)        │ │
│  └─────────────────────────────┘ │
│                                  │
│  [Load more results]             │
│                                  │
└──────────────────────────────────┘
```

**Requirements:**
- [✓] Search input with min 2 characters
- [✓] Autocomplete suggestions (calls `/ingredient/search`)
- [✓] Display card for each ingredient
- [✓] Show all 5 scores (overall, blood sugar, inflammation, gut, hormonal)
- [✓] Progress bars for visual representation
- [✓] Evidence confidence badge
- [✓] Source count
- [✓] "Add to today's log" button (quick action)
- [✓] Loading state during search
- [✓] Error state if API fails

---

#### Page: Personal Insights (/dashboard/insights)

**Components:**
```
┌────────────────────────────────────┐
│ AUREA                   [Refresh]  │
├────────────────────────────────────┤
│                                    │
│  YOUR PERSONAL INSIGHTS            │
│  Based on 47 logged days           │
│  Last updated: 2 hours ago         │
│                                    │
│  ⚠️ This data is for personal     │
│     awareness only, not medical   │
│     advice. Consult a doctor if   │
│     concerned about symptoms.      │
│                                    │
│  ─────────────────────────────────│
│  YOUR TOP TRIGGERS                │
│  ─────────────────────────────────│
│                                    │
│  🔴 EMULSIFIERS → BLOATING        │
│     Correlation: 72%              │
│     Observed: 5 times             │
│     "When you eat foods with      │
│      emulsifiers, you report      │
│      bloating 72% of the time."   │
│     Peak timing: 6-12 hours       │
│                                    │
│  🟡 REFINED CARBS → ENERGY DIP   │
│     Correlation: 64%              │
│     Observed: 4 times             │
│     Confidence: Medium            │
│     Peak timing: 4-6 hours        │
│                                    │
│  🟢 RAW VEGETABLES → FOCUS       │
│     Correlation: 58%              │
│     Observed: 3 times             │
│     Confidence: Low               │
│                                    │
│  ─────────────────────────────────│
│  CYCLE PATTERNS (Optional)        │
│  ─────────────────────────────────│
│                                    │
│  Energy by Phase:                 │
│  Follicular: ▓▓▓▓░ 4.2/5         │
│  Luteal:     ▓▓▓░░ 3.1/5         │
│  Difference: ↓ 26%               │
│                                    │
│  ─────────────────────────────────│
│  NEXT STEPS                       │
│  ─────────────────────────────────│
│  Keep logging! Your predictions   │
│  will get more accurate as you   │
│  add more data.                   │
│                                    │
└────────────────────────────────────┘
```

**Requirements:**
- [✓] Check: Is data sufficient (21+ days)?
  - If NO: Show "Need more data" message
  - If YES: Display insights
- [✓] Top 3-5 triggers with card layout
- [✓] Each trigger shows: ingredient, symptom, correlation %, observations
- [✓] Natural language interpretation
- [✓] Lag timing (if available)
- [✓] Cycle analysis (if user enabled + logged cycle phases)
- [✓] Confidence indicators (low/medium/high/strong)
- [✓] Refresh button (manual recompute)
- [✓] Medical disclaimer
- [✓] Loading state
- [✓] Error handling

---

#### Page: My Predictions (/dashboard/predictions)

**Components:**
```
┌────────────────────────────────────┐
│ AUREA                              │
├────────────────────────────────────┤
│                                    │
│  PREDICTION ENGINE                 │
│                                    │
│  🔮 WHAT WILL THIS DO TO ME?      │
│                                    │
│  [Search ingredients...]           │
│                                    │
│  ┌─ Selected Ingredients ────────┐ │
│  │ ✓ White bread                │ │
│  │ ✓ Butter                     │ │
│  │ ✓ Cheese                     │ │
│  │                              │ │
│  │ [Remove] [Add another]       │ │
│  └──────────────────────────────┘ │
│                                    │
│  CYCLE PHASE (optional):           │
│  ○ Follicular ◉ Ovulation         │
│  ○ Luteal     ○ Menstruation      │
│                                    │
│  [PREDICT]                         │
│                                    │
│  ─────────────────────────────────│
│  PREDICTION RESULT                 │
│  ─────────────────────────────────│
│                                    │
│  📊 BLOATING PROBABILITY: 68%      │
│     ████████░░░░░░░░░             │
│                                    │
│  Confidence: Medium (3 observations)│
│                                    │
│  "Based on your history, when you │
│  eat this combination, you report  │
│  bloating 68% of the time, peak   │
│  impact: 6-12 hours after eating."│
│                                    │
│  [SAVE THIS COMBINATION]           │
│  [TRY DIFFERENT INGREDIENTS]       │
│                                    │
│  ─────────────────────────────────│
│  RECENT PREDICTIONS                │
│  ─────────────────────────────────│
│                                    │
│  • White bread + butter + cheese  │
│    Bloating: 68% | Saved 2 days  │
│                                    │
│  • Salad + olive oil               │
│    Bloating: 12% | Saved 5 days   │
│                                    │
└────────────────────────────────────┘
```

**Requirements:**
- [✓] Check: Is data sufficient (7+ days)?
  - If NO: Show "Need more data" message
  - If YES: Show prediction engine
- [✓] Ingredient search + multi-select
- [✓] Cycle phase selector (optional)
- [✓] Predict button
- [✓] Display prediction result with probability bar
- [✓] Show confidence level
- [✓] Natural language interpretation
- [✓] Save predictions
- [✓] Show recent predictions history
- [✓] Loading state during prediction
- [✓] Error handling

---

### Shared Components

#### IngredientCard
Displays ingredient with scores, used in multiple pages.

```
Props:
- ingredient: IngredientScore
- onAddClick: () => void
- showAddButton: boolean

Displays:
- Ingredient name
- Overall risk score (0-100)
- Category breakdown (5 bars)
- Hormonal relevance
- Evidence confidence
- Optional: Add button
```

#### SymptomSlider
5-point slider for symptoms.

```
Props:
- label: string ("Energy", "Bloating", etc.)
- value: number (0-5)
- onChange: (value: number) => void

Displays:
- Label
- Slider with visual feedback
- Numeric value (0/5)
- Optional icons (😞 to 😊)
```

#### IngredientPill
Small ingredient tag with remove button.

```
Props:
- ingredient: string
- onRemove: () => void

Displays:
- Ingredient name
- Remove (X) button
```

---

### Design System

**Colors:**
- Primary: #06B6D4 (Cyan/Teal)
- Secondary: #8B5CF6 (Purple)
- Success: #10B981 (Green)
- Warning: #F59E0B (Amber)
- Danger: #EF4444 (Red)
- Background: #FFFFFF
- Text: #1F2937 (Dark gray)
- Border: #E5E7EB (Light gray)

**Typography:**
- Headings: Inter, font-weight: 700, sizes: 32/28/24/20/16
- Body: Inter, font-weight: 400, size: 16
- Small: Inter, font-weight: 400, size: 14

**Spacing:** 4px base unit (4, 8, 12, 16, 24, 32, 40, 48, 64)

**Breakpoints:**
- Mobile: < 640px
- Tablet: 640px - 1024px
- Desktop: > 1024px

---

## Backend Specifications

### Project Structure

```
backend/
├── app/
│   ├── __init__.py
│   ├── main.py                    # FastAPI app creation + middleware
│   ├── api/
│   │   ├── __init__.py
│   │   ├── routes.py              # All endpoint definitions
│   │   └── schemas.py             # Pydantic models
│   ├── models/
│   │   ├── __init__.py
│   │   └── database.py            # SQLAlchemy models
│   ├── core/
│   │   ├── __init__.py
│   │   ├── config.py              # Settings + environment
│   │   ├── security.py            # JWT + password hashing
│   │   └── database.py            # DB session management
│   └── services/
│       ├── __init__.py
│       ├── api_wrapper.py         # [YOU] Multi-API integration
│       ├── ingredient_scorer.py   # [YOU] Scoring logic
│       ├── ml_predictor.py        # [YOU] ML models
│       └── analysis_engine.py     # [YOU] Insights generation
├── tasks/
│   └── daily_retrain.py           # [YOU] Background jobs
├── tests/
│   ├── __init__.py
│   ├── test_auth.py
│   ├── test_endpoints.py
│   └── conftest.py
├── migrations/                     # Alembic migrations
├── notebooks/
│   ├── eda.ipynb                  # [YOU] Exploratory analysis
│   └── model_testing.ipynb        # [YOU] Model development
├── main.py                        # Entry point
├── requirements.txt
├── alembic.ini
├── pytest.ini
└── .env.example
```

### Key Files

#### main.py (Entry Point)
```python
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.core.database import engine, Base
from app.api import routes
from app.core.config import settings

# Create tables
Base.metadata.create_all(bind=engine)

# Create app
app = FastAPI(
    title="Aurea API",
    description="Personal ingredient predictor",
    version="1.0.0"
)

# CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.CORS_ORIGINS,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Routes
app.include_router(routes.router, prefix="/api/v1", tags=["api"])

@app.get("/health")
def health():
    return {"status": "ok", "version": "1.0.0"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)
```

#### routes.py (All Endpoints)
All endpoints from API Specifications section, structured with:
```python
from fastapi import APIRouter, Depends, HTTPException
from app.core.security import get_current_user
from app.api import schemas
from app.services import ingredient_scorer, ml_predictor, analysis_engine

router = APIRouter()

# Auth routes
@router.post("/auth/signup", response_model=schemas.UserResponse)
async def signup(user: schemas.UserCreate):
    # Implementation
    pass

# Ingredient routes
@router.get("/ingredient/{name}")
async def get_ingredient(name: str):
    # Call: ingredient_scorer.score_ingredient(name)
    pass

# Log routes
@router.post("/logs", dependencies=[Depends(get_current_user)])
async def create_log(log: schemas.UserLogCreate):
    # Implementation
    pass

# ... etc for all endpoints
```

#### services/api_wrapper.py (You Implement)

```python
# YOUR IMPLEMENTATION
class IngredientDataFetcher:
    """Fetch ingredient data from Open Food Facts + USDA, merge results"""
    
    async def fetch_from_openfoodfacts(self, ingredient_name: str) -> dict:
        """Query Open Food Facts API"""
        pass
    
    async def fetch_from_usda(self, ingredient_name: str) -> dict:
        """Query USDA FoodData Central"""
        pass
    
    async def merge_results(self, off_data: dict, usda_data: dict) -> dict:
        """Merge and normalize API responses"""
        pass
    
    async def get_merged_data(self, ingredient_name: str) -> dict:
        """Main method: fetch from both APIs and merge"""
        pass
```

#### services/ingredient_scorer.py (You Implement)

```python
# YOUR IMPLEMENTATION
class IngredientScorer:
    """Score ingredients on health dimensions"""
    
    async def score_ingredient(self, name: str) -> schemas.IngredientScore:
        """
        Main scoring logic.
        Input: ingredient name
        Output: Scores for blood sugar, inflammation, gut, hormonal
        """
        pass
    
    def _compute_blood_sugar_score(self, data: dict) -> int:
        """YOUR RULES: How does this affect blood sugar?"""
        pass
    
    def _compute_inflammation_score(self, data: dict) -> int:
        """YOUR RULES: Inflammatory markers?"""
        pass
    
    # ... etc for other scores
```

#### services/ml_predictor.py (You Implement)

```python
# YOUR IMPLEMENTATION
class PersonalPredictorModel:
    """Per-user ML model to predict symptom outcomes"""
    
    async def train(self, user_id: str, user_logs: list) -> dict:
        """Train model on user's logged data"""
        pass
    
    async def predict_outcome(self, user_id: str, ingredients: list) -> schemas.PredictionOutput:
        """Predict symptom outcomes for ingredient list"""
        pass
    
    def _extract_ingredient_features(self, ingredients: list) -> np.ndarray:
        """Feature engineering: convert ingredients to vectors"""
        pass
```

#### services/analysis_engine.py (You Implement)

```python
# YOUR IMPLEMENTATION
class InsightEngine:
    """Analyze logs to find ingredient-symptom correlations"""
    
    async def generate_insights(self, user_id: str) -> dict:
        """Main insights generation"""
        pass
    
    def _identify_triggers(self, logs: list) -> list:
        """Find which ingredients correlate with symptoms"""
        pass
    
    def _analyze_lag_effects(self, logs: list) -> dict:
        """When do symptoms appear after eating?"""
        pass
```

#### tasks/daily_retrain.py (You Implement)

```python
# YOUR IMPLEMENTATION
# Background job to retrain models daily

@scheduled_task(hour=0, minute=0)  # 00:00 UTC daily
async def retrain_all_models():
    """For each user with 5+ logs, retrain their model"""
    pass
```

---

### Database Migrations (Alembic)

```bash
# Initial setup (Claude Code does this)
alembic init migrations

# Create migration
alembic revision --autogenerate -m "Add users and logs tables"

# Apply migrations
alembic upgrade head
```

---

## Data Science Implementation

### Your Work: Core ML Pipeline

This is YOUR responsibility. Claude Code scaffolds, you implement.

### Phase 1: Ingredient Scoring (Week 2)

**Goal:** Build scoring function that takes ingredient data → returns health scores

```python
# app/services/ingredient_scorer.py

class IngredientScorer:
    async def score_ingredient(self, name: str) -> dict:
        """
        Takes ingredient name.
        Returns health scores based on research + rules.
        """
        
        # Step 1: Fetch data from APIs
        data = await self.fetcher.get_merged_data(name)
        
        # Step 2: Apply your scoring rules
        score = {
            "blood_sugar_impact": self._compute_blood_sugar_score(data),
            "inflammation_potential": self._compute_inflammation_score(data),
            "gut_impact": self._compute_gut_score(data),
            "hormonal_relevance": self._compute_hormonal_relevance(data),
            "evidence_confidence": self._assess_confidence(data),
        }
        
        # Step 3: Cache in DB
        await self._cache_score(name, score)
        
        return score
    
    def _compute_blood_sugar_score(self, data: dict) -> int:
        """
        YOUR LOGIC HERE
        
        Factors:
        - Added sugars (grams per 100g)
        - Refined starches
        - Fiber content
        - Glycemic index
        
        Returns: 0-100
        0 = Blood sugar spike risk
        100 = Very stable
        """
        
        score = 80  # Start neutral
        
        sugars = data.get('total_sugars', 0)
        fiber = data.get('fiber', 0)
        additives = data.get('additives', [])
        
        # Rule 1: High sugar = lower score
        if sugars > 10:
            score -= 30
        elif sugars > 5:
            score -= 15
        
        # Rule 2: High sugar + low fiber = extra penalty
        if sugars > 0 and fiber < sugars * 0.3:
            score -= 20
        
        # Rule 3: Refined starches = penalty
        if any(ad in additives for ad in ['glucose syrup', 'maltose']):
            score -= 15
        
        return max(0, min(100, score))
    
    def _compute_inflammation_score(self, data: dict) -> int:
        """
        YOUR LOGIC HERE
        
        Factors:
        - Omega-6 to Omega-3 ratio
        - Refined oils
        - Additives with inflammatory markers
        - Ultra-processing level
        
        Returns: 0-100
        0 = High inflammation risk
        100 = Low inflammation risk
        """
        
        score = 75
        
        # Your rules here
        
        return max(0, min(100, score))
    
    def _compute_gut_score(self, data: dict) -> int:
        """
        YOUR LOGIC HERE
        
        Factors:
        - Sugar alcohols
        - Gums/thickeners
        - Fermentable fibers
        - Emulsifiers
        
        Returns: 0-100
        0 = High digestive discomfort risk
        100 = Well tolerated
        """
        
        score = 80
        
        # Your rules here
        
        return max(0, min(100, score))
    
    def _compute_hormonal_relevance(self, data: dict) -> list:
        """
        YOUR LOGIC HERE
        
        Returns: List of hormonal effects with confidence
        E.g., ["insulin_spiking", "estrogen_mimic_candidate"]
        """
        
        relevance = []
        
        # Your logic here
        
        return relevance
    
    def _assess_confidence(self, data: dict) -> str:
        """
        Based on available research, how confident are the scores?
        
        Returns: "strong", "mixed", or "emerging"
        """
        
        # Count sources, check consistency
        
        return "mixed"  # Default
```

**Your Task:**
- Research: What makes each ingredient risky/safe?
- Implement: Write scoring rules for each category
- Test: Does it make sense? (sugar should score low, water should score high)
- Refine: Iterate based on user feedback

---

### Phase 2: ML Model Training (Week 3)

**Goal:** Train per-user model on their logged data to predict symptoms

```python
# app/services/ml_predictor.py

import pandas as pd
import numpy as np
from sklearn.ensemble import RandomForestClassifier
from sklearn.preprocessing import StandardScaler

class PersonalPredictorModel:
    async def train(self, user_id: str) -> dict:
        """
        Train model on user's logged data.
        Requires: 5+ logs
        """
        
        # Step 1: Fetch user's logs
        logs = await db.get_user_logs(user_id)
        
        if len(logs) < 5:
            return {"status": "insufficient_data", "need": 5, "have": len(logs)}
        
        # Step 2: Feature engineering
        X = []  # Feature vectors (ingredient scores)
        y = []  # Target (symptom outcomes)
        
        for log in logs:
            # Convert ingredients to features
            features = self._extract_ingredient_features(log['ingredients'])
            X.append(features)
            
            # Target: bloating (you choose what to predict)
            y.append(log['symptoms']['bloating'])
        
        X = np.array(X)
        y = np.array(y)
        
        # Step 3: Train model
        self.scaler = StandardScaler()
        X_scaled = self.scaler.fit_transform(X)
        
        self.model = RandomForestClassifier(n_estimators=50, max_depth=5)
        self.model.fit(X_scaled, y > 2)  # Predict: bloating > moderate?
        
        # Step 4: Evaluate
        accuracy = self.model.score(X_scaled, y > 2)
        
        # Step 5: Save model
        await self._save_model(user_id, self.model, self.scaler)
        
        return {"status": "trained", "accuracy": accuracy}
    
    async def predict_outcome(self, user_id: str, ingredients: list) -> dict:
        """
        Predict symptom outcome for ingredient list.
        """
        
        # Load model
        model, scaler = await self._load_model(user_id)
        
        if model is None:
            return {"status": "model_not_trained"}
        
        # Feature engineering
        features = self._extract_ingredient_features(ingredients)
        X_scaled = scaler.transform([features])
        
        # Predict
        prediction_proba = model.predict_proba(X_scaled)[0]
        bloating_probability = prediction_proba[1]  # P(bloating=true)
        
        return {
            "bloating_probability": float(bloating_probability),
            "confidence_level": self._assess_confidence(len(logs)),
            "interpretation": f"Probability of bloating: {bloating_probability:.0%}"
        }
    
    def _extract_ingredient_features(self, ingredients: list) -> np.ndarray:
        """
        Convert ingredient list to feature vector.
        
        Simple approach: Average the scores of all ingredients
        """
        
        scores = []
        
        for ing in ingredients:
            score = asyncio.run(self.scorer.score_ingredient(ing))
            scores.append([
                score['blood_sugar_impact'],
                score['inflammation_potential'],
                score['gut_impact'],
            ])
        
        return np.mean(scores, axis=0) if scores else np.zeros(3)
```

**Your Task:**
- Feature engineering: How to convert ingredients to numbers?
- Model selection: Which ML model? (logistic regression vs random forest vs NN?)
- Hyperparameter tuning: What parameters work best?
- Validation: Test on hold-out data to check accuracy

---

### Phase 3: Insights Generation (Week 3-4)

**Goal:** Analyze logs to find correlations between ingredients and symptoms

```python
# app/services/analysis_engine.py

import pandas as pd
from scipy import stats

class InsightEngine:
    async def generate_insights(self, user_id: str) -> dict:
        """
        Find ingredient-symptom correlations from user's logs.
        """
        
        # Fetch logs
        logs = await db.get_user_logs(user_id, limit=None)
        df = pd.DataFrame(logs)
        
        if len(df) < 21:
            return {"status": "insufficient_data"}
        
        # Find triggers
        triggers = self._identify_triggers(df)
        
        # Analyze lags
        lags = self._analyze_lag_effects(df)
        
        # Cycle analysis (if data exists)
        cycle = self._analyze_cycle_phase_effects(df)
        
        return {
            "top_triggers": triggers,
            "lag_analysis": lags,
            "cycle_analysis": cycle,
        }
    
    def _identify_triggers(self, df: pd.DataFrame) -> list:
        """
        Find which ingredients correlate with high bloating scores.
        
        Method: For each ingredient, compare bloating scores when eaten vs not eaten
        """
        
        triggers = []
        
        # For each ingredient in logs
        for ingredient in self._get_all_ingredients(df):
            
            # Get days when eaten
            eaten_mask = df['ingredients'].apply(lambda x: ingredient in x)
            bloating_when_eaten = df[eaten_mask]['symptoms'].apply(lambda x: x['bloating'])
            
            # Get days when not eaten
            bloating_when_not = df[~eaten_mask]['symptoms'].apply(lambda x: x['bloating'])
            
            if len(bloating_when_eaten) < 2:
                continue  # Not enough observations
            
            # T-test: Is there a significant difference?
            t_stat, p_value = stats.ttest_ind(bloating_when_eaten, bloating_when_not)
            
            if p_value < 0.2:  # Lower threshold for personal data
                triggers.append({
                    "ingredient": ingredient,
                    "mean_when_eaten": float(bloating_when_eaten.mean()),
                    "mean_when_not": float(bloating_when_not.mean()),
                    "p_value": float(p_value),
                    "observations": len(bloating_when_eaten),
                    "confidence": "strong" if p_value < 0.05 else "emerging"
                })
        
        return sorted(triggers, key=lambda x: x['p_value'])[:5]
    
    def _analyze_lag_effects(self, df: pd.DataFrame) -> dict:
        """
        When eaten on Day 1, when does symptom peak?
        
        Check: bloating on Day 1 (0h), Day 1 evening (12h), Day 2 (24h), etc.
        """
        
        lag_effects = {}
        
        # Your lag analysis here
        
        return lag_effects
```

**Your Task:**
- Statistical testing: How confident must a correlation be?
- Lag analysis: Implement time-shifted correlation analysis
- Cycle awareness: Do symptoms differ by menstrual phase?

---

## Deployment & DevOps

### GitHub Workflow

```bash
# Week 1: Initial setup
mkdir aurea && cd aurea
git init
git add .
git commit -m "Initial setup"
git remote add origin https://github.com/YOUR_USERNAME/aurea
git push -u origin main

# Weekly: Push updates
git add .
git commit -m "Implement ingredient scoring"
git push origin main
# → Render auto-deploys in ~2 mins
```

### Render Deployment

#### Frontend Deployment

**Service:** Static Site
- **Build command:** `cd frontend && npm install && npm run build`
- **Publish directory:** `frontend/dist`
- **Environment:**
  ```
  VITE_API_URL=https://api.aurea.onrender.com
  ```
- **URL:** `https://aurea.onrender.com`

#### Backend Deployment

**Service:** Web Service
- **Build command:** `pip install -r requirements.txt`
- **Start command:** `uvicorn app.main:app --host 0.0.0.0 --port $PORT`
- **Environment:**
  ```
  DATABASE_URL=postgres://user:pass@host:5432/aurea
  JWT_SECRET=<generate-random-key>
  ENVIRONMENT=production
  CORS_ORIGINS=["https://aurea.onrender.com"]
  ```
- **URL:** `https://api.aurea.onrender.com`

#### Database

**Service:** PostgreSQL
- **Version:** PostgreSQL 15
- **Storage:** 256MB (free tier)
- **Connection:** Internal + External URLs
- **Backups:** Auto

---

## Success Metrics

### MVP Phase (Weeks 1-8)

| Metric | Target | Validation |
|--------|--------|-----------|
| **Framework Completion** | 100% | All endpoints functional, zero errors |
| **Data Collection** | 5-10 users | Active beta testers logging daily |
| **User Retention** | 70% | 70% of users still active after 3 weeks |
| **Logging Consistency** | 5+ logs/week | Average user logs 5+ times weekly |
| **Data Quality** | <5% invalid | <5% of entries have errors |
| **Prediction Readiness** | 100% | Users can see predictions after 7 days |
| **Insights Accuracy** | >60% | Correlation findings validated by users |
| **Load Time** | <2s | Frontend pages load in <2 seconds |
| **API Response Time** | <500ms | 95th percentile response <500ms |
| **Uptime** | 99% | Service available 99% of time |

### Post-MVP Goals (Months 2-6)

| Goal | Metric | Target |
|------|--------|--------|
| **User Growth** | Monthly active users | 100 → 500 → 1000 |
| **Data Volume** | Total logged entries | 10K → 100K entries |
| **Research Value** | Data quality score | 85%+ accuracy |
| **User Satisfaction** | NPS score | >40 |
| **Feature Adoption** | Feature usage % | 60%+ use cycle tracking |

---

## 8-Week Timeline

### Week 1: Framework Setup
**Duration:** 5 days (Mon-Fri)

- [ ] Days 1-2: Create GitHub repo, local setup, write Claude Code instructions
- [ ] Days 3-5: Claude Code builds framework (autonomous, 3+ hours)
- [ ] Parallel: Set up Render accounts, create PostgreSQL database
- [ ] End of week: Frontend + backend deployed to Render, both running

**Deliverables:**
- ✅ GitHub repo with full scaffolding
- ✅ Render deployments live
- ✅ Database ready
- ✅ All endpoints returning empty responses

---

### Week 2: Ingredient Scoring
**Duration:** 5 days (Mon-Fri)

- [ ] Days 1-2: Research ingredient health properties
  - Blood sugar impact (sugars, fiber, refined starches)
  - Inflammation markers (oils, additives, processing)
  - Gut impact (sugar alcohols, gums, emulsifiers)
  - Hormonal relevance (mechanisms, confidence)
  
- [ ] Days 2-3: Implement `ingredient_scorer.py`
  - Write scoring rules for each category
  - Test with 20 common ingredients
  - Verify results make sense
  
- [ ] Days 4-5: Integration + testing
  - Connect to API wrapper
  - Test endpoint: `GET /ingredient/{name}`
  - Cache results in DB

**Deliverables:**
- ✅ Ingredient scoring logic implemented
- ✅ `/ingredient/{name}` endpoint working
- ✅ 500+ ingredients scored and cached

---

### Week 3: Data Collection & ML Foundations
**Duration:** 5 days (Mon-Fri)

- [ ] Days 1-2: Start logging your own data
  - Log daily: symptoms + ingredients
  - Use the frontend (test it)
  - Build 7+ days of personal data
  
- [ ] Days 2-3: Implement `ml_predictor.py` framework
  - Feature engineering: ingredient → vectors
  - Model training pipeline
  - Save/load models
  
- [ ] Days 4-5: Start training on your data
  - After 7 days of logs, train first model
  - Check accuracy (should be >50% even with 7 days)
  - Debug feature engineering

**Deliverables:**
- ✅ Personal data collection (7+ days logged)
- ✅ ML model training implemented
- ✅ `/predictions` endpoint working (for you)

---

### Week 4: Insights & Analysis
**Duration:** 5 days (Mon-Fri)

- [ ] Days 1-2: Implement `analysis_engine.py`
  - Correlation analysis (statistical tests)
  - Lag analysis (time-shifted correlations)
  - Cycle phase analysis (if applicable)
  
- [ ] Days 2-3: Testing on personal data
  - After 21 days of logs, run insights
  - Validate: Do results make sense?
  - Debug false positives
  
- [ ] Days 4-5: Backend integration
  - `/insights` endpoint
  - Caching insights in DB
  - Natural language interpretation

**Deliverables:**
- ✅ Insights engine working
- ✅ `/insights` endpoint live
- ✅ Personal insights displayed (21+ days data)

---

### Week 5: Polish & Beta Launch Prep
**Duration:** 5 days (Mon-Fri)

- [ ] Days 1-2: Frontend refinement
  - UI polish (design consistency)
  - Error messages + error handling
  - Loading states
  - Mobile responsiveness
  
- [ ] Days 2-3: Backend hardening
  - Error handling
  - Rate limiting
  - Input validation
  - Database error recovery
  
- [ ] Days 4-5: Prepare for beta
  - Documentation (README)
  - Privacy policy + terms
  - Beta user recruitment (5-10 people)

**Deliverables:**
- ✅ Production-ready frontend
- ✅ Production-ready backend
- ✅ Documentation complete
- ✅ Beta testers recruited

---

### Week 6: Beta Testing & Early Data
**Duration:** 7 days (Mon-Sun)

- [ ] Days 1-3: Beta users start logging
  - Monitor: Are they using it?
  - Fix bugs in real-time
  - Respond to feedback
  
- [ ] Days 4-7: Collect initial data
  - Gather 5-10 users × 7 days = 50+ logs
  - Retrain models on aggregated data
  - Validate insights make sense
  - Iterate on scoring rules

**Deliverables:**
- ✅ 5-10 active beta users
- ✅ 50+ logged entries
- ✅ Models trained on real user data
- ✅ Bug fixes deployed

---

### Week 7: Model Refinement
**Duration:** 5 days (Mon-Fri)

- [ ] Days 1-3: Analyze beta data
  - Which predictions are accurate?
  - Which correlations are strong?
  - Any false positives?
  
- [ ] Days 2-4: Refine models
  - Adjust feature engineering
  - Try different ML models (SVMs, neural nets?)
  - Tune hyperparameters
  - Improve accuracy
  
- [ ] Days 5: Documentation + writeup
  - Data science methods
  - Model accuracy results
  - Limitations + disclaimers

**Deliverables:**
- ✅ Models refined for real data
- ✅ Improved prediction accuracy (target: >65%)
- ✅ Data science documentation
- ✅ Research-grade methodology

---

### Week 8: Final Polish & Launch
**Duration:** 5 days (Mon-Fri)

- [ ] Days 1-2: Final frontend/backend polish
  - Last UX tweaks
  - Performance optimization
  - Load testing
  
- [ ] Days 2-3: Security audit
  - Password hashing verified
  - JWT tokens secure
  - API auth working
  - SQL injection prevention
  
- [ ] Days 4-5: Launch
  - Deploy to production
  - Announce to beta users
  - Monitor for issues
  - Iterate based on feedback

**Deliverables:**
- ✅ Production system live
- ✅ Beta users active + engaged
- ✅ First month of real data
- ✅ Ready for next phase

---

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|--------|
| **API rate limits exceeded** | Medium | High | Implement caching, batch requests, use multiple APIs |
| **Data insufficient for good predictions** | Low | High | Require 7+ days before predictions, show confidence levels |
| **ML model overfits on small user data** | High | Medium | Use simple models (logistic regression), cross-validation, regularization |
| **Users don't log consistently** | Medium | High | Good UX, reminders, show value early (insights at 14 days) |
| **Privacy concerns** | Low | High | GDPR-compliant data deletion, clear privacy policy, no data sharing |
| **Database corruption/loss** | Very Low | Extreme | Regular backups, Render auto-backups, versioned migrations |
| **Claude Code builds wrong structure** | Low | Medium | Review code before pushing, manual fixes if needed |
| **Render uptime issues** | Low | Medium | Database backups, consider alternative hosting if needed |
| **Ingredient data quality issues** | Medium | Medium | Start with curated ingredients, manual review of new ones |

---

## Future Roadmap (Post-MVP)

### Phase 2 (Months 2-3)
- [ ] Advanced ML (neural networks, time series)
- [ ] Wearable integration (Apple Health, Oura)
- [ ] Recipe database (predict outcomes of full meals)
- [ ] Mobile app (React Native)
- [ ] Social features (share meal ideas safely)

### Phase 3 (Months 4-6)
- [ ] Material scanner (skincare, cosmetics, textiles)
- [ ] Non-food product scanning
- [ ] Community insights (anonymized trend reports)
- [ ] Research partnerships (publish findings)
- [ ] Dietary recommendations (AI-powered meal plans)

### Phase 4 (Months 6-12)
- [ ] Clinical validation (work with nutritionists)
- [ ] Regulatory approval (health claims)
- [ ] Premium features (personalized coaching)
- [ ] Fundraising (venture capital)
- [ ] Scale to 10K+ users

---

## Conclusion

**Aurea** is an ambitious data science project that bridges nutrition science, machine learning, and product design. By week 8, you'll have:

✅ **Full-stack application** (frontend + backend + database)
✅ **Data science core** (ingredient scoring + ML prediction + insight generation)
✅ **Real user data** (5-10 beta testers with weeks of logs)
✅ **Working predictions** (symptom outcomes based on personal history)
✅ **Portfolio piece** (impressive for college/internships)

This isn't just an app—it's a **research platform** that could genuinely help people understand their bodies better.

**Let's build it.**

---

## Appendices

### A. Glossary

- **Bloating:** Abdominal distension/discomfort
- **Correlation:** Statistical relationship between two variables
- **Lag analysis:** Time delay between cause (ingredient) and effect (symptom)
- **Menstrual cycle:** Follicular (days 1-14), ovulation (day 14), luteal (days 14-28)
- **Model training:** Machine learning algorithm learning patterns from data
- **Prediction confidence:** Statistical certainty in prediction (low/medium/high)
- **Trigger:** An ingredient that consistently correlates with a symptom

### B. References & Sources

- USDA FoodData Central: https://fdc.nal.usda.gov/
- Open Food Facts: https://world.openfoodfacts.org/
- Scikit-learn ML: https://scikit-learn.org/
- FastAPI Documentation: https://fastapi.tiangolo.com/
- React Vite Setup: https://vitejs.dev/guide/

### C. Contact & Support

For questions about this PRD:
- Reach out via GitHub issues
- PRD version history maintained in version control
- Updates quarterly as product evolves

---

**Document Version:** 1.0  
**Last Updated:** January 20, 2026  
**Status:** Ready for Development  
**Approval:** Approved for MVP Build
