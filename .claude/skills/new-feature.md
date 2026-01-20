---
name: new-feature
description: Complete feature development Agentic Flow - orchestrates multiple specialized agents through a full development lifecycle
argument-hint: "<provide feature name and description>"
---

# Feature Development Workflow

**Feature Request:** $ARGUMENTS

---

## Workflow State Management

Before starting, I will create a workflow state file to track progress:

```json
{
  "feature": "$ARGUMENTS",
  "featureSlug": "$FEATURE_SLUG",
  "startedAt": "$TIMESTAMP",
  "currentPhase": 1,
  "currentStep": "1.1",
  "status": "in_progress",
  "checkpoints": {
    "design_approved": false,
    "backend_complete": false,
    "frontend_complete": false,
    "e2e_complete": false
  },
  "outputs": []
}
```

**Location:** `docs/features/$FEATURE_SLUG/workflow-state.json`

---

## Phase 1: Requirements & Design

### Step 1.1: Requirements Analysis

I will act as a **Product Manager** to:

1. Parse the feature description and extract core requirements
2. Identify user stories in format: "As a [user], I want [feature], so that [benefit]"
3. Define clear acceptance criteria for each user story
4. List edge cases and error scenarios
5. Identify dependencies on existing features

**Tasks:**
- [ ] Create feature directory: `docs/features/$FEATURE_SLUG/`
- [ ] Analyze feature request
- [ ] Write user stories
- [ ] Define acceptance criteria
- [ ] Document edge cases

**Output:** Create `docs/features/$FEATURE_SLUG/requirements.md`

```markdown
# Feature Requirements: $FEATURE_NAME

## Overview
[Brief description]

## User Stories
1. As a [user], I want [feature], so that [benefit]

## Acceptance Criteria
- [ ] Criterion 1
- [ ] Criterion 2

## Edge Cases
- Case 1: [description]

## Dependencies
- [List existing features/modules this depends on]
```

---

### Step 1.2: Technical Architecture

I will invoke the **@architect** agent to:

1. Review requirements document
2. Design API contracts (OpenAPI/Swagger spec)
3. Design database schema changes (if needed)
4. Plan frontend components and state management
5. Identify integration points with existing code
6. Assess technical risks and mitigation strategies

**Tasks:**
- [ ] Review existing codebase patterns
- [ ] Design API endpoints
- [ ] Design data models
- [ ] Plan frontend architecture
- [ ] Document integration points

**Output:** Create `docs/features/$FEATURE_SLUG/design.md`

```markdown
# Technical Design: $FEATURE_NAME

## API Design

### Endpoints
| Method | Path | Description |
|--------|------|-------------|
| GET | /api/... | ... |

### Request/Response Schemas
[Pydantic schema definitions]

## Database Schema
[SQLAlchemy model definitions]

## Frontend Architecture
- Components: [list]
- State Management: [approach]
- Routes: [new routes if any]

## Integration Points
- [Existing module] → [How it connects]

## Technical Risks
| Risk | Impact | Mitigation |
|------|--------|------------|
```

---

### CHECKPOINT: Design Review

**Status:** Awaiting approval

Before proceeding to implementation, review:
- [ ] Requirements are complete and unambiguous
- [ ] API design follows existing patterns
- [ ] Database changes are backward-compatible
- [ ] Frontend approach aligns with existing architecture

**To proceed:** Confirm design approval or request changes.

---

## Phase 2: Backend Development

### Step 2.1: Database Layer

I will invoke the **@backend-engineer** agent to:

1. Create database migration (if schema changes needed)
2. Update SQLAlchemy model definitions
3. Create or update repository interfaces
4. Run and verify migration

**Commands:**
```bash
cd backend
alembic revision --autogenerate -m "$FEATURE_SLUG"
alembic upgrade head
```

**Location:** `backend/app/models/`

**Tasks:**
- [ ] Create/update model definitions
- [ ] Create migration file
- [ ] Run migration
- [ ] Verify database state

---

### Step 2.2: API Implementation

I will invoke the **@backend-engineer** agent to:

1. Create Pydantic schemas with validators
2. Implement service layer with business logic
3. Create API routes with proper decorators
4. Add comprehensive error handling
5. Implement proper logging

**Location:** `backend/app/`

**File Structure:**
```
backend/app/
├── api/
│   ├── routes.py (add new endpoints)
│   └── schemas.py (add new schemas)
├── models/
│   └── database.py (add new models)
└── services/
    └── $FEATURE_SLUG.py (new service file)
```

**Tasks:**
- [ ] Create Pydantic schemas with validation
- [ ] Implement service layer
- [ ] Create API endpoints
- [ ] Add error handling
- [ ] Add logging

---

### Step 2.3: Backend Tests

I will invoke the **@test-writer** agent to:

1. Write unit tests for service layer
2. Write integration tests for API endpoints
3. Achieve minimum 80% code coverage
4. Run and verify all tests pass

**Location:** `backend/tests/`

**Commands:**
```bash
# Run feature-specific tests
pytest -k $FEATURE_SLUG

# Run with coverage
pytest --cov=app -k $FEATURE_SLUG
```

**Tasks:**
- [ ] Write service unit tests
- [ ] Write API integration tests
- [ ] Verify coverage >= 80%
- [ ] All tests passing

---

### CHECKPOINT: Backend Complete

**Verification:**
```bash
cd backend

# Install dependencies
pip install -r requirements.txt

# Run tests
pytest

# Start server
uvicorn app.main:app --reload

# Manual API verification
curl -X GET http://localhost:8000/$FEATURE_SLUG
```

**Checklist:**
- [ ] Code runs without errors
- [ ] All tests passing
- [ ] API endpoints respond correctly

---

## Phase 3: Frontend Development

### Step 3.1: API Client Layer

I will invoke the **@frontend-engineer** agent to:

1. Add TypeScript types for API responses
2. Create API client functions
3. Add to centralized API service

**Location:** `frontend/src/lib/api.js`

**Tasks:**
- [ ] Add API client methods
- [ ] Add error handling
- [ ] Add request/response logging

---

### Step 3.2: State Management

I will invoke the **@frontend-engineer** agent to:

**TanStack Query hooks:**
```javascript
// hooks/use$Feature.js
export function use$Feature() {
  return useQuery({
    queryKey: ['$feature'],
    queryFn: $featureApi.getAll,
  });
}

export function useCreate$Feature() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: $featureApi.create,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['$feature'] });
    },
  });
}
```

**Tasks:**
- [ ] Create hooks for data fetching
- [ ] Create hooks for mutations
- [ ] Add optimistic updates if needed

---

### Step 3.3: UI Components

I will invoke the **@frontend-engineer** + **@ui-designer** agents to:

1. Create presentational components
2. Apply consistent styling (Tailwind CSS)
3. Handle loading, error, and empty states
4. Ensure accessibility (ARIA labels, keyboard navigation)
5. Make responsive for different screen sizes

**Tasks:**
- [ ] Create list/grid component
- [ ] Create detail/form component
- [ ] Add loading skeletons
- [ ] Add error states
- [ ] Verify accessibility
- [ ] Test responsive behavior

---

### Step 3.4: Integration & Navigation

I will invoke the **@frontend-engineer** agent to:

1. Connect components to hooks
2. Wire up API calls
3. Add navigation routes
4. Update dashboard/sidebar if needed

**Tasks:**
- [ ] Connect components to hooks
- [ ] Add route definitions
- [ ] Implement navigation
- [ ] Add to menu/sidebar if needed

---

### Step 3.5: Frontend Tests

I will invoke the **@test-writer** agent to:

1. Write component tests (rendering, interactions)
2. Write hook tests
3. Write integration tests

**Commands:**
```bash
cd frontend
npm test -- --testPathPattern=$FEATURE_SLUG
```

**Tasks:**
- [ ] Component unit tests
- [ ] Hook tests
- [ ] Integration tests

---

### CHECKPOINT: Frontend Complete

**Verification:**
```bash
cd frontend
npm run lint
npm run build
npm run dev  # Manual visual verification
```

**Checklist:**
- [ ] Code compiles without errors
- [ ] All tests passing
- [ ] No linting errors
- [ ] UI renders correctly
- [ ] Interactions work as expected

---

## Phase 4: End-to-End Testing

### Step 4.1: E2E Test Scenarios

I will invoke the **@test-writer** agent to create comprehensive E2E tests:

**Tasks:**
- [ ] Write happy path tests
- [ ] Write error scenario tests
- [ ] Write edge case tests

---

### Step 4.2: Run Full Test Suite

**Commands:**
```bash
# Backend tests
cd backend
pytest

# Frontend tests
cd frontend
npm test

# Build verification
cd frontend
npm run build
```

**Tasks:**
- [ ] All unit tests passing
- [ ] All integration tests passing
- [ ] Build succeeds

---

## Phase 5: Documentation

### API Documentation
- Update OpenAPI/Swagger spec

### Code Documentation
- Add docstrings to public interfaces
- Document complex business logic

### User Documentation
- Update README if setup changed
- Add entry to CHANGELOG.md

**Tasks:**
- [ ] Update API documentation
- [ ] Add code documentation
- [ ] Update CHANGELOG.md
- [ ] Update README if needed

---

## Phase 6: Final Verification

### Pre-Merge Checklist

```
Code Quality:
- [ ] All tests passing (unit, integration)
- [ ] Code coverage >= 80%
- [ ] No linting errors
- [ ] No TypeScript errors

Functionality:
- [ ] All acceptance criteria met
- [ ] Edge cases handled
- [ ] Error handling complete
- [ ] Loading states implemented

Security:
- [ ] Input validation in place
- [ ] No SQL injection vulnerabilities
- [ ] No XSS vulnerabilities
- [ ] Authentication/authorization correct

Documentation:
- [ ] API docs updated
- [ ] CHANGELOG updated
- [ ] Code comments where needed
```

### Final Commands

```bash
# Backend
cd backend
pytest
uvicorn app.main:app --reload

# Frontend
cd frontend
npm run lint
npm run build
npm run dev

# Manual verification
# Test all endpoints and UI flows
```

---

## Completion Summary

When workflow completes, provide summary:

```markdown
# Feature Complete: $FEATURE_NAME

## Summary
- **Status:** COMPLETE / BLOCKED
- **Files Changed:** [count]

## What Was Built
- [List of major components]

## Tests Added
- Unit tests: [count]
- Integration tests: [count]
- Coverage: [percentage]

## Documentation Updated
- [List of docs]

## Known Limitations
- [Any limitations or future improvements]
```

---

## Quick Commands

```bash
# Backend
cd backend
pip install -r requirements.txt
uvicorn app.main:app --reload
pytest

# Frontend
cd frontend
npm install
npm run dev
npm run build
npm test
```
