# Aurea Framework Build Instructions

You are Claude Code. Your job is to build the complete Aurea framework scaffolding.
The user will implement data science modules later. Your job is framework + scaffolding.

## Project Overview

**Aurea** is a personal health ingredient predictor that:
1. Users search/log ingredients eaten
2. App scores ingredients on health impact (blood sugar, inflammation, gut, hormonal)
3. Users log daily symptoms
4. ML model predicts future symptoms based on ingredients
5. Shows personalized insights + trigger correlations

## Folder Structure (Final)
```
aurea/
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   │   ├── IngredientSearch.jsx
│   │   │   ├── DailyLogger.jsx
│   │   │   ├── Dashboard.jsx
│   │   │   └── shared/
│   │   ├── pages/
│   │   │   ├── HomePage.jsx
│   │   │   ├── LoginPage.jsx
│   │   │   ├── SignupPage.jsx
│   │   │   └── DashboardPage.jsx
│   │   ├── lib/
│   │   │   ├── api.js (fetch functions)
│   │   │   └── utils.js
│   │   ├── hooks/
│   │   │   ├── useAuth.js
│   │   │   └── useIngredients.js
│   │   ├── App.jsx
│   │   ├── main.jsx
│   │   └── index.css
│   ├── public/
│   ├── package.json
│   ├── vite.config.js
│   └── tailwind.config.js
│
├── backend/
│   ├── app/
│   │   ├── __init__.py
│   │   ├── main.py (FastAPI app creation)
│   │   ├── api/
│   │   │   ├── __init__.py
│   │   │   ├── routes.py (all endpoints)
│   │   │   └── schemas.py (Pydantic models)
│   │   ├── models/
│   │   │   ├── __init__.py
│   │   │   └── database.py (SQLAlchemy models)
│   │   ├── core/
│   │   │   ├── __init__.py
│   │   │   ├── config.py (settings)
│   │   │   ├── security.py (JWT auth)
│   │   │   └── database.py (DB connection)
│   │   └── services/
│   │       ├── __init__.py
│   │       ├── api_wrapper.py (YOU: API integration)
│   │       ├── ingredient_scorer.py (YOU: scoring logic)
│   │       ├── ml_predictor.py (YOU: ML models)
│   │       └── analysis_engine.py (YOU: insights)
│   ├── tasks/
│   │   └── daily_retrain.py (YOU: background jobs)
│   ├── migrations/ (Alembic for DB schema)
│   ├── tests/
│   │   └── test_endpoints.py
│   ├── main.py (entry point)
│   ├── requirements.txt
│   ├── alembic.ini
│   └── .env
│
├── .github/
│   └── workflows/
│       └── tests.yml (optional: CI/CD)
│
├── .gitignore
├── .env.example
└── README.md
```

## Phase 1: Frontend Build

Build a React + Vite application with:

**Technologies:**
- React 18
- Vite
- Tailwind CSS
- Shadcn/ui components
- TanStack Query (React Query)
- Zustand (state management)
- Axios for API calls

**Key Pages:**

1. **Landing Page** (`pages/HomePage.jsx`)
   - Hero section: "Discover what your ingredients really do"
   - CTA: Sign up / Log in
   - Simple features summary

2. **Auth Pages** 
   - `pages/SignupPage.jsx`: Email, password, confirm password
   - `pages/LoginPage.jsx`: Email, password, "remember me"
   - Use simple JWT (token stored in localStorage)

3. **Main Dashboard** (`pages/DashboardPage.jsx`)
   - Left sidebar: navigation
   - Main content area:
     * Daily logger form
     * Recent logs history
     * Personal insights
     * Settings

**Key Components:**

1. **IngredientSearch** (`components/IngredientSearch.jsx`)
   - Search box: user types ingredient name
   - Calls GET /ingredient/{name}
   - Displays: 
     * Overall score (0-100)
     * Category breakdown (blood_sugar, inflammation, gut, hormonal)
     * Evidence confidence
     * Sources/citations

2. **DailyLogger** (`components/DailyLogger.jsx`)
   - Food input: search + select ingredients
   - 5 symptom sliders (0-5): energy, bloating, focus, mood, sleep
   - Optional: cycle phase dropdown
   - Submit button → POST /logs

3. **Dashboard** (`components/Dashboard.jsx`)
   - Shows user's recent logs
   - Displays personal insights (from GET /insights)
   - Weekly trends
   - Top triggers

**Styling:**
- Use Tailwind CSS core utilities only (no custom config)
- Shadcn/ui for buttons, forms, cards, dialogs
- Mobile-responsive (mobile-first design)

**API Integration:**
- `lib/api.js` exports functions: searchIngredient(), submitLog(), getInsights()
- Base URL from VITE_API_URL env variable
- Error handling: show toast notifications
- Loading states: spinners on buttons

**Auth:**
- Login: POST /auth/login → stores JWT in localStorage
- Protected routes: redirect to login if no token
- useAuth hook: provides user state

**Build output:** npm run build → creates frontend/dist/

## Phase 2: Backend Build

Build a FastAPI application with:

**Technologies:**
- FastAPI
- SQLAlchemy (ORM)
- Pydantic (validation)
- PostgreSQL driver (psycopg2)
- PyJWT (JWT auth)
- Python-dotenv
- CORS middleware

**Database Schema:**
```sql
-- Users table
CREATE TABLE users (
    id UUID PRIMARY KEY,
    email VARCHAR UNIQUE NOT NULL,
    password_hash VARCHAR NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- User logs (daily entries)
CREATE TABLE user_logs (
    id UUID PRIMARY KEY,
    user_id UUID FOREIGN KEY,
    date DATE NOT NULL,
    ingredients JSONB,  -- ["sugar", "emulsifier", ...]
    symptoms JSONB,     -- {"energy": 4, "bloating": 2, ...}
    cycle_phase VARCHAR,  -- "menstruation", "follicular", etc.
    created_at TIMESTAMP DEFAULT NOW()
);

-- Cached ingredient scores
CREATE TABLE ingredient_scores (
    id UUID PRIMARY KEY,
    ingredient_name VARCHAR UNIQUE,
    blood_sugar_impact INT,
    inflammation_potential INT,
    gut_impact INT,
    hormonal_relevance JSONB,
    evidence_confidence VARCHAR,
    sources JSONB,
    cached_at TIMESTAMP
);

-- User predictions
CREATE TABLE predictions (
    id UUID PRIMARY KEY,
    user_id UUID FOREIGN KEY,
    predicted_date DATE,
    ingredients JSONB,
    predicted_bloating_probability FLOAT,
    confidence VARCHAR,
    created_at TIMESTAMP
);
```

**API Endpoints:**
```
AUTH:
POST /auth/signup
  Body: {email, password}
  Returns: {user_id, token}

POST /auth/login
  Body: {email, password}
  Returns: {user_id, token}

INGREDIENTS:
GET /ingredient/{name}
  Returns: {name, blood_sugar_impact, inflammation_potential, gut_impact, hormonal_relevance, evidence_confidence, sources}
  Calls: app.services.ingredient_scorer.score_ingredient()

LOGS:
POST /logs (requires auth)
  Body: {ingredients: [...], symptoms: {...}, cycle_phase: ""}
  Returns: {log_id, created_at}
  Saves to DB

GET /logs (requires auth)
  Returns: [{date, ingredients, symptoms, cycle_phase}, ...]
  User's full log history

GET /logs/{date}
  Returns: single log for that date

DELETE /logs/{log_id} (requires auth)
  Deletes a log entry

PREDICTIONS:
GET /predictions (requires auth)
  Returns: [{predicted_date, ingredients, predicted_symptom_probability, confidence}, ...]
  Calls: app.services.ml_predictor.predict_outcome()

POST /predictions (requires auth)
  Body: {ingredients: [...], cycle_phase: ""}
  Returns: {bloating_probability, confidence, interpretation}

INSIGHTS:
GET /insights (requires auth)
  Returns: {top_triggers, phase_analysis, lag_analysis, confidence_assessment}
  Calls: app.services.analysis_engine.generate_insights()

HEALTH:
GET /health
  Returns: {status: "ok"}
```

**Services (DO NOT IMPLEMENT - User will fill these in):**

All of these should be empty async functions with detailed docstrings.
User will implement the actual logic.

1. `app/services/api_wrapper.py`
   - class IngredientDataFetcher
   - Methods: fetch_from_openfoodfacts(), fetch_from_usda(), merge_results()
   - Docstring: "Queries Open Food Facts and USDA APIs, merges ingredient data"

2. `app/services/ingredient_scorer.py`
   - class IngredientScorer
   - Methods: score_ingredient(), _compute_blood_sugar_score(), etc.
   - Docstring: "Takes raw ingredient data, returns health scores"

3. `app/services/ml_predictor.py`
   - class PersonalPredictorModel
   - Methods: train(), predict_outcome()
   - Docstring: "Per-user ML model to predict symptom outcomes"

4. `app/services/analysis_engine.py`
   - class InsightEngine
   - Methods: generate_insights(), _identify_triggers(), _analyze_lag_effects()
   - Docstring: "Analyzes user logs to find ingredient-symptom correlations"

**Key Implementation Details:**

- Use SQLAlchemy ORM for all DB queries
- Use Pydantic for request/response validation
- JWT auth: create token on login, validate on protected routes
- CORS: allow frontend domain
- Error handling: return proper HTTP status codes + error messages
- Async/await: all routes and services should be async
- Rate limiting: optional but recommended
- Database migrations: use Alembic

**Config:**
- app/core/config.py: Settings class (DATABASE_URL, JWT_SECRET, CORS_ORIGINS, etc.)
- Load from environment variables using python-dotenv

**Deployment:**
- Start command: uvicorn app.main:app --host 0.0.0.0 --port $PORT
- This should run migrations on startup
- Health check: GET /health should return 200

**Build output:** requirements.txt with all dependencies

## Additional Files

**requirements.txt:**
```
fastapi==0.104.1
uvicorn==0.24.0
sqlalchemy==2.0.23
psycopg2-binary==2.9.9
pydantic==2.5.0
pydantic-settings==2.1.0
python-dotenv==1.0.0
PyJWT==2.8.1
python-multipart==0.0.6
alembic==1.13.1
pytest==7.4.3
httpx==0.25.2
```

**vite.config.js:**
```javascript
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  server: {
    proxy: {
      '/api': {
        target: 'http://localhost:8000',
        changeOrigin: true,
        rewrite: (path) => path.replace(/^\/api/, '')
      }
    }
  }
})
```

## Build Instructions

**Phase 1: Frontend (Start here)**
1. Create folder structure in frontend/
2. Set up Vite + React
3. Install dependencies: npm install
4. Create all components
5. Create all pages
6. Set up routing (React Router)
7. Set up TanStack Query
8. Add tailwind.config.js and globals CSS
9. Create lib/api.js with fetch functions
10. Test locally: npm run dev
11. Build: npm run build (creates frontend/dist/)

**Phase 2: Backend (After frontend)**
1. Create folder structure in backend/
2. Set up FastAPI app in main.py
3. Create all API routes in api/routes.py
4. Create all Pydantic schemas in api/schemas.py
5. Create SQLAlchemy models in models/database.py
6. Create empty service functions (with docstrings)
7. Set up authentication (JWT)
8. Set up CORS
9. Create Alembic migrations
10. Test locally: python main.py
11. Create requirements.txt

## Success Criteria

**Frontend:**
- npm run dev works (runs on http://localhost:5173)
- All pages load without errors
- API calls have proper error handling
- UI is responsive (mobile + desktop)
- Forms validate input
- Auth tokens stored/retrieved correctly

**Backend:**
- python main.py works (runs on http://localhost:8000)
- GET /health returns 200
- All endpoints return proper JSON
- Database migrations run on startup
- Protected routes require auth
- Service functions have proper docstrings
- requirements.txt is complete

## Important Notes

1. Do NOT implement the service functions (ingredient_scorer, ml_predictor, analysis_engine).
   Leave them as empty async functions with detailed docstrings.
   User will implement these for the actual data science work.

2. All endpoints that need business logic should call service functions.
   If a service function isn't implemented, return a mock response or 501 (Not Implemented).

3. Database schema should support rapid iteration (user testing starts week 5).

4. Code should be clean, well-commented, and follow FastAPI/React best practices.

5. Use async/await throughout for performance.

6. All sensitive config should come from environment variables.

## Run Autonomously

You have full autonomy. Fix errors, iterate, deploy. You're done when:
- Frontend builds successfully, runs locally, connects to backend
- Backend runs locally, all endpoints respond correctly
- Database schema is set up and migrations work
- Both can be pushed to GitHub without errors
- README includes local setup instructions

Go.
EOF