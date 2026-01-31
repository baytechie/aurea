# Aurea Health - Personal Ingredient Predictor

Track what you eat, understand how ingredients affect your body, and get personalized insights to feel your best.

## Live Deployment

| Service | URL | Status |
|---------|-----|--------|
| **Frontend PWA** | https://aureahealth.app | ✅ Live |
| **Backend API** | https://api.aureahealth.app | ✅ Live |
| **Data Science Dashboard** | https://datascience.aureahealth.app | ✅ Live |

## Features

- **Ingredient Search**: Get health impact scores for any ingredient (blood sugar, inflammation, gut, hormonal)
- **Daily Logging**: Track ingredients eaten and symptom ratings
- **ML Predictions**: Personalized predictions based on your history
- **Insights**: Discover your trigger foods and patterns
- **Data Science Dashboard**: Analyze ingredient data and user patterns

## Tech Stack

### Frontend (PWA)
- React 19 + Vite
- Tailwind CSS 4
- TanStack Query (React Query)
- Zustand (state management)
- React Router 7

### Backend API
- FastAPI (Python 3.11)
- SQLAlchemy 2.0 ORM
- PostgreSQL (Render)
- JWT Authentication
- Alembic (migrations)

### Data Science Dashboard
- Streamlit
- Pandas, NumPy
- Plotly (visualizations)
- SQLAlchemy (database access)

### Mobile App (iOS)
- React Native 0.76
- TypeScript
- React Navigation 6
- Zustand (state management)

## Quick Start

### Option 1: Use the Development Script

```bash
git clone https://github.com/baytechie/aurea.git
cd aurea
./start-dev.sh
```

This starts both frontend and backend with proper environment configuration.

### Option 2: Manual Setup

#### Backend

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

# Start server
python main.py
```

Backend: `http://localhost:8000`
API Docs: `http://localhost:8000/docs`

#### Frontend

```bash
cd frontend

# Install dependencies
npm install

# Set up environment variables
echo "VITE_API_URL=http://localhost:8000" > .env

# Start development server
npm run dev
```

Frontend: `http://localhost:5173`

#### Admin Dashboard

```bash
cd admin
./start-admin.sh
```

Dashboard: `http://localhost:8501`

## API Endpoints

| Method | Endpoint | Description | Auth |
|--------|----------|-------------|------|
| GET | `/health` | Health check | No |
| POST | `/auth/signup` | Register | No |
| POST | `/auth/login` | Login | No |
| GET | `/ingredient/{name}` | Get ingredient scores | No |
| GET | `/ingredient/search` | Search ingredients | No |
| POST | `/logs` | Create daily log | Yes |
| GET | `/logs` | Get user's logs | Yes |
| GET | `/logs/{date}` | Get log by date | Yes |
| DELETE | `/logs/{id}` | Delete log | Yes |
| POST | `/predictions` | Request prediction | Yes |
| GET | `/predictions` | Get predictions | Yes |
| GET | `/insights` | Get user insights | Yes |
| GET | `/users/me` | Get current user | Yes |
| PATCH | `/users/me` | Update profile | Yes |

## Project Structure

```
aurea/
├── frontend/               # React PWA
│   ├── src/
│   │   ├── components/     # React components
│   │   ├── pages/          # Page components
│   │   ├── hooks/          # Custom hooks
│   │   ├── lib/            # API client, utilities
│   │   ├── store/          # Zustand stores
│   │   └── App.jsx         # Main app
│   └── public/             # Static assets, PWA manifest
│
├── backend/                # FastAPI Backend
│   ├── app/
│   │   ├── api/            # Routes and schemas
│   │   ├── core/           # Config, DB, security
│   │   ├── models/         # SQLAlchemy models
│   │   └── services/       # Business logic
│   ├── migrations/         # Alembic migrations
│   └── tests/              # Pytest tests
│
├── admin/                  # Streamlit Dashboard
│   ├── app.py              # Main dashboard
│   └── requirements.txt
│
├── mobile/                 # React Native iOS App
│   ├── src/
│   │   ├── screens/        # Screen components
│   │   ├── navigation/     # Navigation setup
│   │   ├── hooks/          # Custom hooks
│   │   └── lib/            # API client
│   └── ios/                # Xcode project
│
├── docs/                   # Documentation
│   ├── adr/                # Architecture decisions
│   ├── api/                # API documentation
│   └── design/             # UI specifications
│
├── render.yaml             # Render deployment config
└── .claude/                # Claude Code configuration
    ├── agents/             # Specialized agents
    └── skills/             # Workflow skills
```

## Deployment

### Render (Current Production)

The project uses Render Blueprint (`render.yaml`) for deployment:

```bash
# Push to GitHub triggers auto-deploy
git push origin main
```

**Services Created:**
- `aurea-web` - Static site for frontend
- `aurea-api` - Web service for backend
- `aurea-datascience` - Web service for Streamlit
- `aurea-db` - PostgreSQL database

### DNS Configuration (Porkbun/Registrar)

| Type | Name | Value |
|------|------|-------|
| CNAME | @ | aurea-web.onrender.com |
| CNAME | www | aurea-web.onrender.com |
| CNAME | api | aurea-api.onrender.com |
| CNAME | datascience | aurea-datascience.onrender.com |

## Known Gaps & Roadmap

### Critical (P0)
- [ ] ML Services return mock data (need real implementation)
- [ ] Database migrations not created
- [ ] Admin dashboard needs authentication

### High Priority (P1)
- [ ] API versioning (`/api/v1/`)
- [ ] Rate limiting
- [ ] Password reset flow
- [ ] CI/CD pipeline
- [ ] Test coverage

### Medium Priority (P2)
- [ ] TypeScript migration (frontend)
- [ ] Offline support (mobile)
- [ ] Push notifications
- [ ] Role-based access control

See `docs/adr/` for architecture decisions and roadmap.

## Development

### Using Claude Code Skills

```bash
/new-feature <description>    # Full feature workflow
/aurea-feature <description>  # Aurea-specific workflow
/fix-bug <description>        # Bug investigation
/review-pr <PR number>        # PR review
/analyze-codebase             # Codebase health
```

### Available Agents

- `@architect` - System design and architecture
- `@backend-engineer` - Backend development
- `@frontend-engineer` - Frontend development
- `@test-writer` - Writing tests
- `@code-reviewer` - Code review
- `@security-auditor` - Security analysis
- `@safe-researcher` - Codebase exploration

## Testing

```bash
# Backend
cd backend
pytest -v
pytest --cov=app

# Frontend
cd frontend
npm run build
npm run lint

# Mobile
cd mobile
npm test
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make changes
4. Run tests
5. Submit a pull request

## License

MIT
