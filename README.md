# Aurea - Personal Ingredient Predictor

Track what you eat, understand how ingredients affect your body, and get personalized insights to feel your best.

## Features

- **Ingredient Search**: Get health impact scores for any ingredient (blood sugar, inflammation, gut, hormonal)
- **Daily Logging**: Track ingredients eaten and symptom ratings
- **ML Predictions**: Personalized predictions based on your history
- **Insights**: Discover your trigger foods and patterns

## Tech Stack

**Frontend:**
- React 18 + Vite
- Tailwind CSS
- TanStack Query (React Query)
- Zustand (state management)
- React Router

**Backend:**
- FastAPI (Python)
- SQLAlchemy ORM
- PostgreSQL
- JWT Authentication
- Alembic (migrations)

## Quick Start

### Prerequisites

- Node.js 18+
- Python 3.10+
- PostgreSQL 15+

### 1. Clone the Repository

```bash
git clone https://github.com/baytechie/aurea.git
cd aurea
```

### 2. Backend Setup

```bash
cd backend

# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Set up environment variables
cp .env.example .env
# Edit .env with your database credentials

# Create database
createdb aurea  # or use pgAdmin

# Run migrations
alembic upgrade head

# Start server
python main.py
```

Backend will be running at `http://localhost:8000`

### 3. Frontend Setup

```bash
cd frontend

# Install dependencies
npm install

# Set up environment variables
echo "VITE_API_URL=http://localhost:8000" > .env

# Start development server
npm run dev
```

Frontend will be running at `http://localhost:5173`

## API Endpoints

| Method | Endpoint | Description | Auth |
|--------|----------|-------------|------|
| GET | `/health` | Health check | No |
| POST | `/auth/signup` | Register | No |
| POST | `/auth/login` | Login | No |
| GET | `/ingredient/{name}` | Get ingredient scores | No |
| POST | `/logs` | Create daily log | Yes |
| GET | `/logs` | Get user's logs | Yes |
| GET | `/logs/{date}` | Get log by date | Yes |
| DELETE | `/logs/{id}` | Delete log | Yes |
| POST | `/predictions` | Request prediction | Yes |
| GET | `/predictions` | Get predictions | Yes |
| GET | `/insights` | Get user insights | Yes |

## Project Structure

```
aurea/
├── frontend/
│   ├── src/
│   │   ├── components/     # React components
│   │   ├── pages/          # Page components
│   │   ├── hooks/          # Custom hooks
│   │   ├── lib/            # API client, utilities
│   │   ├── store/          # Zustand stores
│   │   └── App.jsx         # Main app
│   └── package.json
│
├── backend/
│   ├── app/
│   │   ├── api/            # Routes and schemas
│   │   ├── core/           # Config, DB, security
│   │   ├── models/         # SQLAlchemy models
│   │   └── services/       # Business logic (TO IMPLEMENT)
│   ├── migrations/         # Alembic migrations
│   ├── tests/              # Pytest tests
│   └── requirements.txt
│
└── .claude/                # Claude Code agents and skills
    ├── agents/             # Specialized agents
    └── skills/             # Workflow skills
```

## Services to Implement

The following service files are scaffolded with detailed docstrings but need implementation:

1. **`backend/app/services/api_wrapper.py`**
   - Fetches ingredient data from Open Food Facts and USDA APIs
   - Merges and normalizes results

2. **`backend/app/services/ingredient_scorer.py`**
   - Calculates health impact scores for ingredients
   - Considers blood sugar, inflammation, gut, and hormonal factors

3. **`backend/app/services/ml_predictor.py`**
   - Trains per-user ML models on log history
   - Predicts symptom outcomes for ingredients

4. **`backend/app/services/analysis_engine.py`**
   - Analyzes user logs for patterns
   - Identifies trigger ingredients and correlations

## Testing

### Backend Tests

```bash
cd backend
pytest -v
pytest --cov=app  # With coverage
```

### Frontend Build

```bash
cd frontend
npm run build
npm run lint
```

## Deployment (Render)

### Database (PostgreSQL)

1. Create PostgreSQL database on Render
2. Copy the connection string

### Backend

1. Create Web Service
2. Build Command: `pip install -r requirements.txt`
3. Start Command: `uvicorn app.main:app --host 0.0.0.0 --port $PORT`
4. Set environment variables:
   - `DATABASE_URL`
   - `JWT_SECRET`
   - `ENVIRONMENT=production`
   - `CORS_ORIGINS=["https://your-frontend-url.onrender.com"]`

### Frontend

1. Create Static Site
2. Build Command: `cd frontend && npm install && npm run build`
3. Publish Directory: `frontend/dist`
4. Set environment variable:
   - `VITE_API_URL=https://your-backend-url.onrender.com`

## Development

### Using Claude Code Skills

This project includes Claude Code skills for common workflows:

- `/new-feature <description>` - Full feature development workflow
- `/aurea-feature <description>` - Aurea-specific feature workflow
- `/fix-bug <description>` - Bug investigation and fix
- `/review-pr <PR number>` - Comprehensive PR review
- `/analyze-codebase` - Codebase health analysis

### Available Agents

- `@architect` - System design
- `@backend-engineer` - Backend development
- `@frontend-engineer` - Frontend development
- `@test-writer` - Writing tests
- `@code-reviewer` - Code review
- `@security-auditor` - Security analysis

## License

MIT
