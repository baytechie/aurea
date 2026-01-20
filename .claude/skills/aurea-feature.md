---
name: aurea-feature
description: Aurea-specific feature workflow optimized for the ingredient predictor ecosystem
argument-hint: "<feature description for Aurea app>"
---

# Aurea Feature Workflow

**Feature:** $ARGUMENTS

---

## Project Context

Aurea is a personal ingredient predictor with two components:
- **Backend API** (FastAPI) - `backend/`, port 8000
- **Frontend App** (React + Vite) - `frontend/`, port 5173

---

## Phase 1: Requirements & Design

### Step 1.1: Feature Analysis

I will analyze the feature for Aurea context:
1. Which components are affected? (Backend / Frontend / Both)
2. Is this ingredient-related, user-related, insights-related, or infrastructure?
3. Does it need new database models?
4. What existing patterns should be followed?

**Existing Patterns:**
- Backend: FastAPI Router → Service → SQLAlchemy Model
- Frontend: Component → Hook → API Client → TanStack Query

---

### Step 1.2: Technical Design

I will invoke **@architect** to design:

**For Backend features:**
- Follow existing `backend/app/` structure
- Use SQLAlchemy ORM models
- Implement Pydantic schemas for validation
- Use async/await patterns

**For Frontend features:**
- Follow component structure in `frontend/src/`
- Use TanStack Query for data fetching
- Use Zustand for local state
- Follow existing styling patterns

**Output:** Create `docs/features/$FEATURE_SLUG/design.md`

---

## Phase 2: Backend Development

### Step 2.1: Model & Migration

**Location:** `backend/app/models/`

```python
# Example model following Aurea patterns
from sqlalchemy import Column, String, DateTime, ForeignKey
from sqlalchemy.dialects.postgresql import UUID, JSONB
import uuid

class $Feature(Base):
    __tablename__ = '$feature_slug'

    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id = Column(UUID(as_uuid=True), ForeignKey('users.id'))
    created_at = Column(DateTime, server_default=func.now())
```

### Step 2.2: Pydantic Schemas

**Location:** `backend/app/api/schemas.py`

```python
from pydantic import BaseModel
from uuid import UUID
from datetime import datetime

class $FeatureCreate(BaseModel):
    # fields
    pass

class $FeatureResponse(BaseModel):
    id: UUID
    created_at: datetime

    class Config:
        from_attributes = True
```

### Step 2.3: API Routes

**Location:** `backend/app/api/routes.py`

Following Aurea patterns:
- Use dependency injection for auth
- Return proper HTTP status codes
- Add comprehensive error handling

### Step 2.4: Backend Tests

```bash
cd backend
pytest -k $FEATURE_SLUG
pytest --cov=app
```

---

## Phase 3: Frontend Development

### Step 3.1: API Client Integration

**Location:** `frontend/src/lib/api.js`

Add new API functions following existing patterns.

### Step 3.2: Hooks

**Location:** `frontend/src/hooks/`

```javascript
// use$Feature.js
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { $featureApi } from '../lib/api';

export function use$Feature() {
  return useQuery({
    queryKey: ['$feature'],
    queryFn: $featureApi.getAll,
  });
}
```

### Step 3.3: Components

**Location:** `frontend/src/components/`

Create presentational components following existing patterns:
- Use Tailwind CSS for styling
- Handle loading, error, and empty states
- Ensure mobile responsiveness

### Step 3.4: Frontend Tests

```bash
cd frontend
npm run lint
npm run build
npm test
```

---

## Phase 4: Integration Testing

### API Verification

```bash
# Start backend
cd backend
uvicorn app.main:app --reload

# Test endpoints
curl http://localhost:8000/$FEATURE_SLUG
curl http://localhost:8000/health
```

### Frontend Verification

```bash
cd frontend
npm run dev
# Navigate to http://localhost:5173
# Verify new feature works
```

---

## Phase 5: Documentation

- [ ] Update API docs
- [ ] Update `README.md` if needed
- [ ] Add to `CHANGELOG.md`

---

## Verification Checklist

```
Backend:
- [ ] pytest passes
- [ ] No linting errors
- [ ] API responds correctly
- [ ] Migrations work

Frontend:
- [ ] npm run lint passes
- [ ] npm run build passes
- [ ] Feature works in UI
- [ ] Mobile responsive
```

---

## Quick Commands Reference

```bash
# Backend
cd backend
pip install -r requirements.txt
uvicorn app.main:app --reload
pytest
pytest --cov=app

# Frontend
cd frontend
npm install
npm run dev
npm run build
npm run lint
npm test
```
