# Aurea Database Schema Enhancements

**Document Version:** 1.0
**Date:** January 20, 2026
**Author:** Database Engineering Team
**Database Systems:** PostgreSQL (production), SQLite (development)

---

## Table of Contents

1. [Executive Summary](#1-executive-summary)
2. [Current vs Target Schema Comparison](#2-current-vs-target-schema-comparison)
3. [Schema Enhancement Details](#3-schema-enhancement-details)
4. [New Table Definitions](#4-new-table-definitions)
5. [Index Strategy](#5-index-strategy)
6. [Migration Plan](#6-migration-plan)
7. [Query Optimization Guidelines](#7-query-optimization-guidelines)
8. [Data Integrity Constraints](#8-data-integrity-constraints)
9. [Scalability Considerations](#9-scalability-considerations)
10. [Appendix: SQLAlchemy Model Updates](#appendix-sqlalchemy-model-updates)

---

## 1. Executive Summary

This document outlines the database schema enhancements required for the Aurea platform based on PRD requirements. The changes address:

- **User Profile Expansion**: Adding name, bio, profile_picture_url, and cycle_enabled fields
- **Symptom Denormalization**: Moving from JSON blob to individual columns for better analytics
- **User Insights Caching**: New table for storing computed correlations
- **Performance Optimization**: Comprehensive indexing strategy for 10K+ users

### Key Changes Overview

| Area | Change Type | Priority | Risk Level |
|------|-------------|----------|------------|
| Users table | Column additions | High | Low |
| UserLog symptoms | Denormalization | High | Medium |
| user_insights table | New table | High | Low |
| Indexes | Performance | Medium | Low |

---

## 2. Current vs Target Schema Comparison

### 2.1 Users Table

| Column | Current | Target | Change |
|--------|---------|--------|--------|
| id | UUID PRIMARY KEY | UUID PRIMARY KEY | No change |
| email | VARCHAR(255) UNIQUE NOT NULL | VARCHAR(255) UNIQUE NOT NULL | No change |
| password_hash | VARCHAR(255) NOT NULL | VARCHAR(255) NOT NULL | No change |
| **name** | - | VARCHAR(100) NULL | **ADD** |
| **bio** | - | TEXT NULL | **ADD** |
| **profile_picture_url** | - | VARCHAR(500) NULL | **ADD** |
| **cycle_enabled** | - | BOOLEAN DEFAULT FALSE | **ADD** |
| created_at | TIMESTAMP | TIMESTAMP | No change |
| updated_at | TIMESTAMP | TIMESTAMP | No change |

### 2.2 UserLog Table - Symptom Denormalization

**Current Schema (JSON blob):**
```sql
symptoms JSONB  -- {"energy": 4, "bloating": 2, "focus": 3, "mood": 4, "sleep": 3}
```

**Target Schema (Individual columns):**

| Column | Current | Target | Change |
|--------|---------|--------|--------|
| symptoms | JSONB | DEPRECATED (keep for migration) | Phase out |
| **symptom_energy** | - | SMALLINT CHECK (0-5) | **ADD** |
| **symptom_bloating** | - | SMALLINT CHECK (0-5) | **ADD** |
| **symptom_focus** | - | SMALLINT CHECK (0-5) | **ADD** |
| **symptom_mood** | - | SMALLINT CHECK (0-5) | **ADD** |
| **symptom_sleep** | - | SMALLINT CHECK (0-5) | **ADD** |

**Rationale for Denormalization:**
1. **Query Performance**: Direct column access vs JSON extraction is 5-10x faster
2. **Indexing**: Individual columns can be indexed; JSON fields cannot (without GIN)
3. **Type Safety**: Database enforces value constraints
4. **Analytics**: Enables aggregations (AVG, SUM) without JSON functions
5. **Reporting**: Simplifies SQL for dashboards and reports

### 2.3 New Table: user_insights

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PRIMARY KEY | Unique identifier |
| user_id | UUID | FK -> users.id, NOT NULL | Owner of insight |
| insight_type | VARCHAR(50) | NOT NULL | Type: 'trigger', 'phase_pattern', 'lag_effect' |
| ingredient_name | VARCHAR(255) | NULL | Related ingredient (for triggers) |
| symptom_name | VARCHAR(50) | NULL | Related symptom |
| correlation_score | FLOAT | NULL | Statistical correlation (-1 to 1) |
| confidence_level | VARCHAR(20) | NULL | 'high', 'medium', 'low' |
| sample_size | INTEGER | NULL | Number of data points analyzed |
| insight_data | JSONB | NULL | Additional structured data |
| valid_from | DATE | NOT NULL | Start of analysis period |
| valid_until | DATE | NOT NULL | End of analysis period |
| computed_at | TIMESTAMP | NOT NULL | When insight was calculated |
| is_active | BOOLEAN | DEFAULT TRUE | Soft delete flag |
| created_at | TIMESTAMP | DEFAULT NOW() | Record creation time |

---

## 3. Schema Enhancement Details

### 3.1 User Profile Fields

**Field Specifications:**

```sql
-- name: User's display name
-- - Optional for privacy
-- - Used in UI personalization
-- - Max 100 chars to prevent abuse
name VARCHAR(100) NULL

-- bio: User's personal description
-- - Optional
-- - TEXT type for flexibility
-- - Could contain health goals, dietary restrictions, etc.
bio TEXT NULL

-- profile_picture_url: Avatar/profile image URL
-- - Optional
-- - Store URL, not binary data
-- - 500 chars allows for S3/CDN URLs with tokens
profile_picture_url VARCHAR(500) NULL

-- cycle_enabled: Whether user tracks menstrual cycle
-- - Default FALSE for opt-in privacy
-- - When TRUE, cycle_phase field in user_logs becomes relevant
-- - Enables phase-specific insights
cycle_enabled BOOLEAN DEFAULT FALSE NOT NULL
```

### 3.2 Symptom Column Strategy

**Why Individual Columns Over JSON:**

| Aspect | JSON (Current) | Individual Columns (Target) |
|--------|----------------|----------------------------|
| Query: Get bloating avg | `AVG((symptoms->>'bloating')::int)` | `AVG(symptom_bloating)` |
| Index support | Requires GIN/expression index | Standard B-tree |
| Storage efficiency | Higher overhead per row | More compact |
| Schema flexibility | Can add symptoms without migration | Requires migration |
| Query optimizer | Limited optimization | Full optimizer support |
| Type safety | Runtime validation | Compile-time validation |

**Recommendation:** Use individual columns for the core 5 symptoms (energy, bloating, focus, mood, sleep). Keep a `symptoms_extra` JSONB column for future symptom additions during rapid iteration.

### 3.3 User Insights Architecture

The `user_insights` table serves as a caching layer for expensive correlation computations:

```
                    +------------------+
                    |    user_logs     |
                    +------------------+
                           |
                           | (nightly batch / on-demand)
                           v
                    +------------------+
                    | Analysis Engine  |
                    | (compute heavy)  |
                    +------------------+
                           |
                           v
                    +------------------+
                    |  user_insights   |
                    |  (cached results)|
                    +------------------+
                           |
                           v
                    +------------------+
                    |    API Layer     |
                    | (fast retrieval) |
                    +------------------+
```

**Insight Types:**

1. **trigger** - Ingredient-symptom correlations
   - Example: "Sugar correlates with bloating (r=0.72)"

2. **phase_pattern** - Cycle phase symptom patterns
   - Example: "Energy drops during luteal phase"

3. **lag_effect** - Delayed symptom responses
   - Example: "Dairy affects bloating after 24 hours"

---

## 4. New Table Definitions

### 4.1 SQLAlchemy Model: Enhanced User

```python
class User(Base):
    """User account model with profile fields."""
    __tablename__ = "users"

    id = Column(GUID(), primary_key=True, default=uuid.uuid4)
    email = Column(String(255), unique=True, nullable=False, index=True)
    password_hash = Column(String(255), nullable=False)

    # Profile fields (PRD enhancement)
    name = Column(String(100), nullable=True)
    bio = Column(Text, nullable=True)
    profile_picture_url = Column(String(500), nullable=True)
    cycle_enabled = Column(Boolean, default=False, nullable=False)

    created_at = Column(DateTime, default=datetime.utcnow)
    updated_at = Column(DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)

    # Relationships
    logs = relationship("UserLog", back_populates="user", cascade="all, delete-orphan")
    predictions = relationship("Prediction", back_populates="user", cascade="all, delete-orphan")
    insights = relationship("UserInsight", back_populates="user", cascade="all, delete-orphan")

    def __repr__(self):
        return f"<User {self.email}>"
```

### 4.2 SQLAlchemy Model: Enhanced UserLog

```python
class UserLog(Base):
    """
    Daily log entry for a user.
    Contains ingredients consumed and symptom ratings.
    Symptoms are denormalized for query performance.
    """
    __tablename__ = "user_logs"
    __table_args__ = (
        # Composite index for user date range queries
        Index('ix_user_logs_user_date', 'user_id', 'date'),
        # Unique constraint: one log per user per day
        UniqueConstraint('user_id', 'date', name='uq_user_logs_user_date'),
    )

    id = Column(GUID(), primary_key=True, default=uuid.uuid4)
    user_id = Column(GUID(), ForeignKey("users.id", ondelete="CASCADE"), nullable=False)
    date = Column(Date, nullable=False)

    # Food data - list of ingredient names
    ingredients = Column(JSONType(), default=list)

    # Denormalized symptom ratings (0-5 scale)
    # Individual columns for query performance and indexing
    symptom_energy = Column(SmallInteger, nullable=True)
    symptom_bloating = Column(SmallInteger, nullable=True)
    symptom_focus = Column(SmallInteger, nullable=True)
    symptom_mood = Column(SmallInteger, nullable=True)
    symptom_sleep = Column(SmallInteger, nullable=True)

    # Legacy JSON field (for migration compatibility)
    # Will be deprecated after data migration
    symptoms = Column(JSONType(), default=dict)

    # Extra symptoms for future expansion
    symptoms_extra = Column(JSONType(), default=dict)

    # Optional cycle phase tracking
    cycle_phase = Column(String(50), nullable=True)

    created_at = Column(DateTime, default=datetime.utcnow)
    updated_at = Column(DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)

    # Relationships
    user = relationship("User", back_populates="logs")

    # Check constraints for symptom values
    __table_args__ = (
        CheckConstraint('symptom_energy >= 0 AND symptom_energy <= 5', name='ck_symptom_energy_range'),
        CheckConstraint('symptom_bloating >= 0 AND symptom_bloating <= 5', name='ck_symptom_bloating_range'),
        CheckConstraint('symptom_focus >= 0 AND symptom_focus <= 5', name='ck_symptom_focus_range'),
        CheckConstraint('symptom_mood >= 0 AND symptom_mood <= 5', name='ck_symptom_mood_range'),
        CheckConstraint('symptom_sleep >= 0 AND symptom_sleep <= 5', name='ck_symptom_sleep_range'),
        CheckConstraint("cycle_phase IN ('menstruation', 'follicular', 'ovulation', 'luteal') OR cycle_phase IS NULL",
                       name='ck_cycle_phase_valid'),
        Index('ix_user_logs_user_date', 'user_id', 'date'),
        UniqueConstraint('user_id', 'date', name='uq_user_logs_user_date'),
    )

    def __repr__(self):
        return f"<UserLog {self.date} - {self.user_id}>"

    @property
    def symptoms_dict(self) -> dict:
        """Return symptoms as dictionary (for API compatibility)."""
        return {
            'energy': self.symptom_energy,
            'bloating': self.symptom_bloating,
            'focus': self.symptom_focus,
            'mood': self.symptom_mood,
            'sleep': self.symptom_sleep,
        }
```

### 4.3 SQLAlchemy Model: UserInsight (New)

```python
class UserInsight(Base):
    """
    Cached user insights from correlation analysis.
    Stores pre-computed ingredient-symptom correlations and patterns.
    Updated by background analysis jobs.
    """
    __tablename__ = "user_insights"
    __table_args__ = (
        # Index for retrieving user's active insights by type
        Index('ix_user_insights_user_type_active', 'user_id', 'insight_type', 'is_active'),
        # Index for finding insights by ingredient
        Index('ix_user_insights_ingredient', 'ingredient_name'),
    )

    id = Column(GUID(), primary_key=True, default=uuid.uuid4)
    user_id = Column(GUID(), ForeignKey("users.id", ondelete="CASCADE"), nullable=False, index=True)

    # Insight classification
    insight_type = Column(String(50), nullable=False)
    # Values: 'trigger', 'phase_pattern', 'lag_effect', 'recommendation'

    # Related entities
    ingredient_name = Column(String(255), nullable=True)
    symptom_name = Column(String(50), nullable=True)

    # Statistical measures
    correlation_score = Column(Float, nullable=True)  # -1.0 to 1.0
    confidence_level = Column(String(20), nullable=True)  # 'high', 'medium', 'low'
    sample_size = Column(Integer, nullable=True)  # Number of data points
    p_value = Column(Float, nullable=True)  # Statistical significance

    # Flexible data storage for complex insights
    insight_data = Column(JSONType(), default=dict)
    # Example structures:
    # For triggers: {"avg_symptom_with": 3.5, "avg_symptom_without": 1.2, "occurrences": 15}
    # For phase_pattern: {"menstruation": {"energy_avg": 2.1}, "follicular": {"energy_avg": 3.8}}
    # For lag_effect: {"delay_hours": 24, "correlation_by_lag": {0: 0.2, 24: 0.7, 48: 0.3}}

    # Validity period
    valid_from = Column(Date, nullable=False)
    valid_until = Column(Date, nullable=False)

    # Metadata
    computed_at = Column(DateTime, default=datetime.utcnow, nullable=False)
    is_active = Column(Boolean, default=True, nullable=False)

    created_at = Column(DateTime, default=datetime.utcnow)
    updated_at = Column(DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)

    # Relationships
    user = relationship("User", back_populates="insights")

    # Constraints
    __table_args__ = (
        CheckConstraint("insight_type IN ('trigger', 'phase_pattern', 'lag_effect', 'recommendation')",
                       name='ck_insight_type_valid'),
        CheckConstraint("confidence_level IN ('high', 'medium', 'low') OR confidence_level IS NULL",
                       name='ck_confidence_level_valid'),
        CheckConstraint('correlation_score >= -1.0 AND correlation_score <= 1.0',
                       name='ck_correlation_score_range'),
        CheckConstraint('sample_size >= 0', name='ck_sample_size_positive'),
        Index('ix_user_insights_user_type_active', 'user_id', 'insight_type', 'is_active'),
        Index('ix_user_insights_ingredient', 'ingredient_name'),
    )

    def __repr__(self):
        return f"<UserInsight {self.insight_type}: {self.ingredient_name} -> {self.symptom_name}>"
```

---

## 5. Index Strategy

### 5.1 Index Recommendations by Query Pattern

#### Pattern 1: Get User's Logs by Date Range

**Query:**
```sql
SELECT * FROM user_logs
WHERE user_id = :user_id
  AND date BETWEEN :start_date AND :end_date
ORDER BY date DESC;
```

**Index:**
```sql
CREATE INDEX ix_user_logs_user_date ON user_logs (user_id, date DESC);
```

**Rationale:**
- Composite index covers both filter conditions
- DESC ordering matches typical "recent first" queries
- Estimated query time: < 5ms for 1 year of daily logs

#### Pattern 2: Ingredient Autocomplete Search

**Query:**
```sql
SELECT ingredient_name, overall_score
FROM ingredient_scores
WHERE ingredient_name ILIKE :prefix || '%'
ORDER BY overall_score DESC NULLS LAST
LIMIT 10;
```

**Index (PostgreSQL):**
```sql
-- For prefix matching (autocomplete)
CREATE INDEX ix_ingredient_scores_name_pattern
ON ingredient_scores (ingredient_name varchar_pattern_ops);

-- Alternative: Trigram index for fuzzy matching
CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE INDEX ix_ingredient_scores_name_trgm
ON ingredient_scores USING gin (ingredient_name gin_trgm_ops);
```

**Index (SQLite):**
```sql
-- SQLite doesn't support pattern_ops, use standard index
CREATE INDEX ix_ingredient_scores_name ON ingredient_scores (ingredient_name);
```

**Rationale:**
- `varchar_pattern_ops` optimizes LIKE 'prefix%' queries
- Trigram index enables fuzzy matching ("suagr" finds "sugar")
- Essential for responsive autocomplete UX

#### Pattern 3: Get User's Insights by Type

**Query:**
```sql
SELECT * FROM user_insights
WHERE user_id = :user_id
  AND insight_type = :type
  AND is_active = TRUE
ORDER BY correlation_score DESC NULLS LAST;
```

**Index:**
```sql
CREATE INDEX ix_user_insights_user_type_active
ON user_insights (user_id, insight_type, is_active)
WHERE is_active = TRUE;  -- Partial index
```

**Rationale:**
- Partial index reduces index size by excluding inactive records
- Covers the common query pattern exactly
- Estimated query time: < 2ms

#### Pattern 4: Analytics - Symptom Aggregations

**Query:**
```sql
SELECT
    date_trunc('week', date) as week,
    AVG(symptom_bloating) as avg_bloating,
    AVG(symptom_energy) as avg_energy
FROM user_logs
WHERE user_id = :user_id
  AND date >= :start_date
GROUP BY date_trunc('week', date);
```

**Index:**
```sql
-- Covering index includes symptom columns to avoid table lookups
CREATE INDEX ix_user_logs_analytics
ON user_logs (user_id, date)
INCLUDE (symptom_energy, symptom_bloating, symptom_focus, symptom_mood, symptom_sleep);
```

**Rationale:**
- INCLUDE clause creates a covering index
- Query can be satisfied entirely from the index
- Significant performance improvement for dashboards

### 5.2 Complete Index Summary

| Table | Index Name | Columns | Type | Purpose |
|-------|------------|---------|------|---------|
| users | ix_users_email | email | B-tree (unique) | Login lookup |
| user_logs | ix_user_logs_user_id | user_id | B-tree | FK queries |
| user_logs | ix_user_logs_date | date | B-tree | Date filtering |
| user_logs | ix_user_logs_user_date | (user_id, date DESC) | B-tree | Date range queries |
| user_logs | uq_user_logs_user_date | (user_id, date) | Unique | One log per day |
| ingredient_scores | ix_ingredient_scores_name | ingredient_name | B-tree (unique) | Lookup |
| ingredient_scores | ix_ingredient_scores_name_pattern | ingredient_name | pattern_ops | Autocomplete |
| predictions | ix_predictions_user_id | user_id | B-tree | User's predictions |
| predictions | ix_predictions_user_date | (user_id, predicted_date) | B-tree | Date queries |
| user_insights | ix_user_insights_user_id | user_id | B-tree | FK queries |
| user_insights | ix_user_insights_user_type_active | (user_id, insight_type, is_active) | Partial | Insight retrieval |
| user_insights | ix_user_insights_ingredient | ingredient_name | B-tree | Ingredient lookup |

### 5.3 Index Creation SQL (PostgreSQL)

```sql
-- Users table (email index already exists)
-- No changes needed

-- User logs table
CREATE INDEX CONCURRENTLY IF NOT EXISTS ix_user_logs_user_date
ON user_logs (user_id, date DESC);

CREATE UNIQUE INDEX CONCURRENTLY IF NOT EXISTS uq_user_logs_user_date
ON user_logs (user_id, date);

-- Covering index for analytics
CREATE INDEX CONCURRENTLY IF NOT EXISTS ix_user_logs_analytics
ON user_logs (user_id, date)
INCLUDE (symptom_energy, symptom_bloating, symptom_focus, symptom_mood, symptom_sleep);

-- Ingredient scores table
CREATE INDEX CONCURRENTLY IF NOT EXISTS ix_ingredient_scores_name_pattern
ON ingredient_scores (ingredient_name varchar_pattern_ops);

-- Optional: Trigram for fuzzy search (requires extension)
-- CREATE EXTENSION IF NOT EXISTS pg_trgm;
-- CREATE INDEX CONCURRENTLY IF NOT EXISTS ix_ingredient_scores_name_trgm
-- ON ingredient_scores USING gin (ingredient_name gin_trgm_ops);

-- Predictions table
CREATE INDEX CONCURRENTLY IF NOT EXISTS ix_predictions_user_date
ON predictions (user_id, predicted_date DESC);

-- User insights table (new)
CREATE INDEX CONCURRENTLY IF NOT EXISTS ix_user_insights_user_type_active
ON user_insights (user_id, insight_type)
WHERE is_active = TRUE;

CREATE INDEX CONCURRENTLY IF NOT EXISTS ix_user_insights_ingredient
ON user_insights (ingredient_name)
WHERE ingredient_name IS NOT NULL;
```

---

## 6. Migration Plan

### 6.1 Migration Overview

The migration is split into multiple phases to ensure zero-downtime deployment:

```
Phase 1: Add new columns (non-breaking)
    |
    v
Phase 2: Backfill data (background)
    |
    v
Phase 3: Create new table (non-breaking)
    |
    v
Phase 4: Add indexes (CONCURRENTLY)
    |
    v
Phase 5: Update application code
    |
    v
Phase 6: Remove deprecated columns (future)
```

### 6.2 Alembic Migration Scripts

#### Migration 1: Add User Profile Fields

**File:** `migrations/versions/001_add_user_profile_fields.py`

```python
"""Add user profile fields.

Revision ID: 001_profile_fields
Revises:
Create Date: 2026-01-20

"""
from alembic import op
import sqlalchemy as sa

# revision identifiers
revision = '001_profile_fields'
down_revision = None  # or previous migration
branch_labels = None
depends_on = None


def upgrade():
    """Add profile columns to users table."""
    # All columns are nullable, so this is a non-breaking change
    op.add_column('users', sa.Column('name', sa.String(100), nullable=True))
    op.add_column('users', sa.Column('bio', sa.Text(), nullable=True))
    op.add_column('users', sa.Column('profile_picture_url', sa.String(500), nullable=True))
    op.add_column('users', sa.Column('cycle_enabled', sa.Boolean(),
                                     server_default='false', nullable=False))


def downgrade():
    """Remove profile columns from users table."""
    op.drop_column('users', 'cycle_enabled')
    op.drop_column('users', 'profile_picture_url')
    op.drop_column('users', 'bio')
    op.drop_column('users', 'name')
```

#### Migration 2: Add Denormalized Symptom Columns

**File:** `migrations/versions/002_add_symptom_columns.py`

```python
"""Add denormalized symptom columns to user_logs.

Revision ID: 002_symptom_columns
Revises: 001_profile_fields
Create Date: 2026-01-20

"""
from alembic import op
import sqlalchemy as sa

revision = '002_symptom_columns'
down_revision = '001_profile_fields'
branch_labels = None
depends_on = None


def upgrade():
    """Add individual symptom columns and constraints."""
    # Add symptom columns
    op.add_column('user_logs', sa.Column('symptom_energy', sa.SmallInteger(), nullable=True))
    op.add_column('user_logs', sa.Column('symptom_bloating', sa.SmallInteger(), nullable=True))
    op.add_column('user_logs', sa.Column('symptom_focus', sa.SmallInteger(), nullable=True))
    op.add_column('user_logs', sa.Column('symptom_mood', sa.SmallInteger(), nullable=True))
    op.add_column('user_logs', sa.Column('symptom_sleep', sa.SmallInteger(), nullable=True))
    op.add_column('user_logs', sa.Column('symptoms_extra', sa.Text(), nullable=True))

    # Add check constraints (PostgreSQL only)
    # SQLite will ignore these
    op.execute("""
        ALTER TABLE user_logs
        ADD CONSTRAINT ck_symptom_energy_range
        CHECK (symptom_energy >= 0 AND symptom_energy <= 5)
    """)
    op.execute("""
        ALTER TABLE user_logs
        ADD CONSTRAINT ck_symptom_bloating_range
        CHECK (symptom_bloating >= 0 AND symptom_bloating <= 5)
    """)
    op.execute("""
        ALTER TABLE user_logs
        ADD CONSTRAINT ck_symptom_focus_range
        CHECK (symptom_focus >= 0 AND symptom_focus <= 5)
    """)
    op.execute("""
        ALTER TABLE user_logs
        ADD CONSTRAINT ck_symptom_mood_range
        CHECK (symptom_mood >= 0 AND symptom_mood <= 5)
    """)
    op.execute("""
        ALTER TABLE user_logs
        ADD CONSTRAINT ck_symptom_sleep_range
        CHECK (symptom_sleep >= 0 AND symptom_sleep <= 5)
    """)


def downgrade():
    """Remove symptom columns."""
    # Drop constraints first
    op.execute("ALTER TABLE user_logs DROP CONSTRAINT IF EXISTS ck_symptom_energy_range")
    op.execute("ALTER TABLE user_logs DROP CONSTRAINT IF EXISTS ck_symptom_bloating_range")
    op.execute("ALTER TABLE user_logs DROP CONSTRAINT IF EXISTS ck_symptom_focus_range")
    op.execute("ALTER TABLE user_logs DROP CONSTRAINT IF EXISTS ck_symptom_mood_range")
    op.execute("ALTER TABLE user_logs DROP CONSTRAINT IF EXISTS ck_symptom_sleep_range")

    # Drop columns
    op.drop_column('user_logs', 'symptoms_extra')
    op.drop_column('user_logs', 'symptom_sleep')
    op.drop_column('user_logs', 'symptom_mood')
    op.drop_column('user_logs', 'symptom_focus')
    op.drop_column('user_logs', 'symptom_bloating')
    op.drop_column('user_logs', 'symptom_energy')
```

#### Migration 3: Backfill Symptom Data

**File:** `migrations/versions/003_backfill_symptoms.py`

```python
"""Backfill symptom data from JSON to columns.

Revision ID: 003_backfill_symptoms
Revises: 002_symptom_columns
Create Date: 2026-01-20

NOTE: Run this during low-traffic period.
For large datasets, consider running in batches via script.
"""
from alembic import op
import sqlalchemy as sa

revision = '003_backfill_symptoms'
down_revision = '002_symptom_columns'
branch_labels = None
depends_on = None


def upgrade():
    """Migrate symptom data from JSON to individual columns."""
    # PostgreSQL version - uses JSONB operators
    op.execute("""
        UPDATE user_logs
        SET
            symptom_energy = (symptoms->>'energy')::integer,
            symptom_bloating = (symptoms->>'bloating')::integer,
            symptom_focus = (symptoms->>'focus')::integer,
            symptom_mood = (symptoms->>'mood')::integer,
            symptom_sleep = (symptoms->>'sleep')::integer
        WHERE symptoms IS NOT NULL
          AND symptoms != '{}'::jsonb
          AND symptom_energy IS NULL
    """)


def downgrade():
    """No downgrade needed - JSON column still has original data."""
    pass
```

#### Migration 4: Create User Insights Table

**File:** `migrations/versions/004_create_user_insights.py`

```python
"""Create user_insights table.

Revision ID: 004_user_insights
Revises: 003_backfill_symptoms
Create Date: 2026-01-20

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import postgresql

revision = '004_user_insights'
down_revision = '003_backfill_symptoms'
branch_labels = None
depends_on = None


def upgrade():
    """Create user_insights table with indexes."""
    op.create_table(
        'user_insights',
        sa.Column('id', sa.String(36), primary_key=True),
        sa.Column('user_id', sa.String(36), sa.ForeignKey('users.id', ondelete='CASCADE'),
                  nullable=False, index=True),
        sa.Column('insight_type', sa.String(50), nullable=False),
        sa.Column('ingredient_name', sa.String(255), nullable=True),
        sa.Column('symptom_name', sa.String(50), nullable=True),
        sa.Column('correlation_score', sa.Float(), nullable=True),
        sa.Column('confidence_level', sa.String(20), nullable=True),
        sa.Column('sample_size', sa.Integer(), nullable=True),
        sa.Column('p_value', sa.Float(), nullable=True),
        sa.Column('insight_data', sa.Text(), nullable=True),  # JSON stored as text for SQLite
        sa.Column('valid_from', sa.Date(), nullable=False),
        sa.Column('valid_until', sa.Date(), nullable=False),
        sa.Column('computed_at', sa.DateTime(), nullable=False, server_default=sa.func.now()),
        sa.Column('is_active', sa.Boolean(), nullable=False, server_default='true'),
        sa.Column('created_at', sa.DateTime(), server_default=sa.func.now()),
        sa.Column('updated_at', sa.DateTime(), server_default=sa.func.now(), onupdate=sa.func.now()),
    )

    # Add check constraints
    op.execute("""
        ALTER TABLE user_insights
        ADD CONSTRAINT ck_insight_type_valid
        CHECK (insight_type IN ('trigger', 'phase_pattern', 'lag_effect', 'recommendation'))
    """)
    op.execute("""
        ALTER TABLE user_insights
        ADD CONSTRAINT ck_confidence_level_valid
        CHECK (confidence_level IN ('high', 'medium', 'low') OR confidence_level IS NULL)
    """)
    op.execute("""
        ALTER TABLE user_insights
        ADD CONSTRAINT ck_correlation_score_range
        CHECK (correlation_score >= -1.0 AND correlation_score <= 1.0)
    """)

    # Create indexes
    op.create_index(
        'ix_user_insights_user_type_active',
        'user_insights',
        ['user_id', 'insight_type', 'is_active']
    )
    op.create_index(
        'ix_user_insights_ingredient',
        'user_insights',
        ['ingredient_name']
    )


def downgrade():
    """Drop user_insights table."""
    op.drop_table('user_insights')
```

#### Migration 5: Add Performance Indexes

**File:** `migrations/versions/005_add_performance_indexes.py`

```python
"""Add performance indexes for common query patterns.

Revision ID: 005_performance_indexes
Revises: 004_user_insights
Create Date: 2026-01-20

"""
from alembic import op
import sqlalchemy as sa

revision = '005_performance_indexes'
down_revision = '004_user_insights'
branch_labels = None
depends_on = None


def upgrade():
    """Create performance indexes (use CONCURRENTLY in production)."""
    # Note: In production, run these with CONCURRENTLY to avoid locks
    # ALTER INDEX requires PostgreSQL 12+

    # Composite index for user logs date range queries
    op.create_index(
        'ix_user_logs_user_date',
        'user_logs',
        ['user_id', 'date'],
        unique=False
    )

    # Unique constraint: one log per user per day
    op.create_index(
        'uq_user_logs_user_date',
        'user_logs',
        ['user_id', 'date'],
        unique=True
    )

    # Predictions index
    op.create_index(
        'ix_predictions_user_date',
        'predictions',
        ['user_id', 'predicted_date']
    )

    # PostgreSQL-specific: pattern ops for autocomplete
    # This will fail on SQLite, wrap in try/except in production
    try:
        op.execute("""
            CREATE INDEX IF NOT EXISTS ix_ingredient_scores_name_pattern
            ON ingredient_scores (ingredient_name varchar_pattern_ops)
        """)
    except Exception:
        pass  # SQLite doesn't support this


def downgrade():
    """Remove performance indexes."""
    op.drop_index('ix_predictions_user_date', 'predictions')
    op.drop_index('uq_user_logs_user_date', 'user_logs')
    op.drop_index('ix_user_logs_user_date', 'user_logs')

    try:
        op.drop_index('ix_ingredient_scores_name_pattern', 'ingredient_scores')
    except Exception:
        pass
```

### 6.3 Migration Execution Plan

#### Pre-Migration Checklist

- [ ] Full database backup completed
- [ ] Tested migrations on staging environment
- [ ] Tested rollback on staging environment
- [ ] Notified team of maintenance window (if needed)
- [ ] Verified application can handle schema additions gracefully

#### Execution Steps

```bash
# 1. Backup database
pg_dump -Fc aurea_db > backup_$(date +%Y%m%d_%H%M%S).dump

# 2. Run migrations in order
cd backend
alembic upgrade 001_profile_fields
alembic upgrade 002_symptom_columns
alembic upgrade 003_backfill_symptoms
alembic upgrade 004_user_insights
alembic upgrade 005_performance_indexes

# Or run all at once
alembic upgrade head

# 3. Verify migration success
alembic current
alembic history

# 4. Run verification queries
psql -d aurea_db -c "SELECT COUNT(*) FROM user_logs WHERE symptom_energy IS NOT NULL;"
psql -d aurea_db -c "\d user_insights"
```

#### Rollback Procedure

```bash
# Rollback to specific revision
alembic downgrade 003_backfill_symptoms  # Example: rollback indexes

# Full rollback
alembic downgrade base

# Restore from backup if needed
pg_restore -d aurea_db backup_YYYYMMDD_HHMMSS.dump
```

---

## 7. Query Optimization Guidelines

### 7.1 Common Query Patterns

#### Get User's Recent Logs (Optimized)

```python
# Bad - fetches all columns
logs = db.query(UserLog).filter(
    UserLog.user_id == user_id
).order_by(UserLog.date.desc()).limit(30).all()

# Good - fetches only needed columns
logs = db.query(
    UserLog.id,
    UserLog.date,
    UserLog.ingredients,
    UserLog.symptom_energy,
    UserLog.symptom_bloating,
    UserLog.symptom_focus,
    UserLog.symptom_mood,
    UserLog.symptom_sleep,
    UserLog.cycle_phase
).filter(
    UserLog.user_id == user_id
).order_by(UserLog.date.desc()).limit(30).all()
```

#### Ingredient Autocomplete (PostgreSQL)

```python
# Using ILIKE for case-insensitive prefix match
from sqlalchemy import func

results = db.query(IngredientScore).filter(
    IngredientScore.ingredient_name.ilike(f"{query}%")
).order_by(
    IngredientScore.overall_score.desc().nullslast()
).limit(10).all()

# For fuzzy matching (requires pg_trgm extension)
results = db.query(IngredientScore).filter(
    func.similarity(IngredientScore.ingredient_name, query) > 0.3
).order_by(
    func.similarity(IngredientScore.ingredient_name, query).desc()
).limit(10).all()
```

#### Symptom Aggregation for Analytics

```python
from sqlalchemy import func, extract

# Weekly symptom averages
weekly_stats = db.query(
    func.date_trunc('week', UserLog.date).label('week'),
    func.avg(UserLog.symptom_energy).label('avg_energy'),
    func.avg(UserLog.symptom_bloating).label('avg_bloating'),
    func.count(UserLog.id).label('log_count')
).filter(
    UserLog.user_id == user_id,
    UserLog.date >= start_date
).group_by(
    func.date_trunc('week', UserLog.date)
).order_by('week').all()
```

#### Get Active Insights

```python
# Efficient query using partial index
insights = db.query(UserInsight).filter(
    UserInsight.user_id == user_id,
    UserInsight.insight_type == 'trigger',
    UserInsight.is_active == True
).order_by(
    UserInsight.correlation_score.desc().nullslast()
).limit(10).all()
```

### 7.2 Query Anti-Patterns to Avoid

| Anti-Pattern | Issue | Solution |
|--------------|-------|----------|
| `SELECT *` | Fetches unnecessary columns | Specify needed columns |
| N+1 queries | Multiple queries for related data | Use `joinedload()` or `selectinload()` |
| Missing pagination | Large result sets | Always use `limit()` and `offset()` |
| JSON extraction in WHERE | Cannot use indexes | Use denormalized columns |
| LIKE '%term%' | Full table scan | Use prefix LIKE 'term%' or full-text search |
| ORDER BY without index | Expensive sort operation | Add index covering ORDER BY columns |

### 7.3 Connection Pooling Configuration

```python
# backend/app/core/database.py

# PostgreSQL with connection pooling
engine = create_engine(
    settings.DATABASE_URL,
    pool_pre_ping=True,      # Test connections before use
    pool_size=5,             # Base pool size
    max_overflow=10,         # Additional connections allowed
    pool_timeout=30,         # Wait time for available connection
    pool_recycle=1800,       # Recycle connections every 30 min
)

# For 10K+ users, consider:
# - pool_size=10
# - max_overflow=20
# - Use PgBouncer for external pooling
```

---

## 8. Data Integrity Constraints

### 8.1 Constraint Summary

| Table | Constraint | Type | Purpose |
|-------|-----------|------|---------|
| users | email UNIQUE | Unique | Prevent duplicate accounts |
| users | email NOT NULL | Not Null | Require email for auth |
| user_logs | user_id FK | Foreign Key | Referential integrity |
| user_logs | user_id + date UNIQUE | Unique | One log per day |
| user_logs | symptom_* CHECK 0-5 | Check | Valid symptom range |
| user_logs | cycle_phase CHECK | Check | Valid phase values |
| user_insights | user_id FK CASCADE | Foreign Key | Delete insights with user |
| user_insights | insight_type CHECK | Check | Valid insight types |
| user_insights | correlation_score CHECK | Check | Valid range -1 to 1 |
| predictions | user_id FK CASCADE | Foreign Key | Delete predictions with user |

### 8.2 Cascade Delete Strategy

```
users
  ├── ON DELETE CASCADE → user_logs
  ├── ON DELETE CASCADE → predictions
  └── ON DELETE CASCADE → user_insights
```

When a user is deleted, all related data is automatically removed. This ensures:
- No orphaned records
- GDPR compliance for data deletion requests
- Clean database state

### 8.3 NULL Handling Strategy

| Field | NULL Allowed | Rationale |
|-------|--------------|-----------|
| user.name | Yes | Optional profile field |
| user.bio | Yes | Optional profile field |
| user.profile_picture_url | Yes | Optional avatar |
| user_log.cycle_phase | Yes | Only for users with cycle_enabled=true |
| user_log.symptom_* | Yes | During migration, legacy data may be null |
| user_insight.ingredient_name | Yes | Not all insight types have ingredients |
| user_insight.correlation_score | Yes | Recommendations may not have scores |

---

## 9. Scalability Considerations

### 9.1 Current Estimates

| Metric | Current | 10K Users (Projected) |
|--------|---------|----------------------|
| Users | ~100 | 10,000 |
| User Logs | ~3,000 | 3,650,000 (1 yr * 10K) |
| Predictions | ~500 | 500,000 |
| Insights | ~200 | 200,000 |
| Storage | ~50 MB | ~5 GB |

### 9.2 Partitioning Strategy (Future)

For user_logs table at 10M+ rows, consider date-based partitioning:

```sql
-- Create partitioned table (PostgreSQL 10+)
CREATE TABLE user_logs (
    id UUID,
    user_id UUID,
    date DATE,
    ...
) PARTITION BY RANGE (date);

-- Create monthly partitions
CREATE TABLE user_logs_2026_01 PARTITION OF user_logs
    FOR VALUES FROM ('2026-01-01') TO ('2026-02-01');

CREATE TABLE user_logs_2026_02 PARTITION OF user_logs
    FOR VALUES FROM ('2026-02-01') TO ('2026-03-01');
```

**Benefits:**
- Faster queries on recent data
- Efficient data archival (drop old partitions)
- Parallel query execution across partitions

### 9.3 Sharding Strategy (Future - 100K+ Users)

If scaling beyond 100K users, consider:

1. **User-based sharding**: Route users to database shards by user_id hash
2. **Geographic sharding**: Separate databases by region
3. **Read replicas**: Separate read traffic to replica databases

### 9.4 Caching Strategy

```
                    ┌─────────────┐
                    │   Client    │
                    └──────┬──────┘
                           │
                    ┌──────▼──────┐
                    │   FastAPI   │
                    └──────┬──────┘
                           │
              ┌────────────┼────────────┐
              │            │            │
       ┌──────▼─────┐     │     ┌──────▼──────┐
       │   Redis    │     │     │  PostgreSQL │
       │  (Cache)   │     │     │  (Primary)  │
       └────────────┘     │     └─────────────┘
                          │
                   ┌──────▼──────┐
                   │ user_insights│
                   │  (Cached in  │
                   │   database)  │
                   └──────────────┘
```

**Cache Layers:**
1. **Application cache (Redis)**: Ingredient scores, user sessions
2. **Database cache (user_insights)**: Pre-computed correlations
3. **Query cache (PostgreSQL)**: Frequent query results

### 9.5 Performance Benchmarks (Target)

| Operation | Target Latency | Index Required |
|-----------|---------------|----------------|
| User login | < 50ms | ix_users_email |
| Get user logs (30 days) | < 100ms | ix_user_logs_user_date |
| Ingredient autocomplete | < 50ms | ix_ingredient_scores_name_pattern |
| Get active insights | < 50ms | ix_user_insights_user_type_active |
| Create log entry | < 100ms | N/A |
| Generate insights | < 5s | (background job) |

---

## Appendix: SQLAlchemy Model Updates

### Complete Updated Models File

The following shows the complete updated `backend/app/models/database.py` with all enhancements:

```python
"""
SQLAlchemy database models for Aurea.

Tables:
- users: User accounts with profile fields
- user_logs: Daily food/symptom entries with denormalized symptoms
- ingredient_scores: Cached ingredient health scores
- predictions: ML model predictions
- user_insights: Cached correlation insights

Supports both SQLite (development) and PostgreSQL (production).
"""

import uuid
from datetime import datetime
from sqlalchemy import (
    Column, String, DateTime, Date, Integer, Float, ForeignKey,
    func, Text, TypeDecorator, Boolean, SmallInteger, Index,
    UniqueConstraint, CheckConstraint
)
from sqlalchemy.orm import relationship
import json

from app.core.database import Base


# Custom type for UUID that works with both SQLite and PostgreSQL
class GUID(TypeDecorator):
    """Platform-independent GUID type."""
    impl = String(36)
    cache_ok = True

    def process_bind_param(self, value, dialect):
        if value is not None:
            return str(value)
        return value

    def process_result_value(self, value, dialect):
        if value is not None:
            return uuid.UUID(value)
        return value


# Custom type for JSON that works with both SQLite and PostgreSQL
class JSONType(TypeDecorator):
    """Platform-independent JSON type."""
    impl = Text
    cache_ok = True

    def process_bind_param(self, value, dialect):
        if value is not None:
            return json.dumps(value)
        return value

    def process_result_value(self, value, dialect):
        if value is not None:
            return json.loads(value)
        return value


class User(Base):
    """User account model with profile fields."""
    __tablename__ = "users"

    id = Column(GUID(), primary_key=True, default=uuid.uuid4)
    email = Column(String(255), unique=True, nullable=False, index=True)
    password_hash = Column(String(255), nullable=False)

    # Profile fields (PRD enhancement)
    name = Column(String(100), nullable=True)
    bio = Column(Text, nullable=True)
    profile_picture_url = Column(String(500), nullable=True)
    cycle_enabled = Column(Boolean, default=False, nullable=False)

    created_at = Column(DateTime, default=datetime.utcnow)
    updated_at = Column(DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)

    # Relationships
    logs = relationship("UserLog", back_populates="user", cascade="all, delete-orphan")
    predictions = relationship("Prediction", back_populates="user", cascade="all, delete-orphan")
    insights = relationship("UserInsight", back_populates="user", cascade="all, delete-orphan")

    def __repr__(self):
        return f"<User {self.email}>"


class UserLog(Base):
    """
    Daily log entry for a user.
    Contains ingredients consumed and symptom ratings.
    Symptoms are denormalized into individual columns for query performance.
    """
    __tablename__ = "user_logs"

    id = Column(GUID(), primary_key=True, default=uuid.uuid4)
    user_id = Column(GUID(), ForeignKey("users.id", ondelete="CASCADE"), nullable=False)
    date = Column(Date, nullable=False)

    # Food data - list of ingredient names
    ingredients = Column(JSONType(), default=list)

    # Denormalized symptom ratings (0-5 scale)
    symptom_energy = Column(SmallInteger, nullable=True)
    symptom_bloating = Column(SmallInteger, nullable=True)
    symptom_focus = Column(SmallInteger, nullable=True)
    symptom_mood = Column(SmallInteger, nullable=True)
    symptom_sleep = Column(SmallInteger, nullable=True)

    # Legacy JSON field (deprecated - for migration compatibility)
    symptoms = Column(JSONType(), default=dict)

    # Extra symptoms for future expansion
    symptoms_extra = Column(JSONType(), default=dict)

    # Optional cycle phase tracking
    cycle_phase = Column(String(50), nullable=True)

    created_at = Column(DateTime, default=datetime.utcnow)
    updated_at = Column(DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)

    # Relationships
    user = relationship("User", back_populates="logs")

    # Table constraints and indexes
    __table_args__ = (
        Index('ix_user_logs_user_id', 'user_id'),
        Index('ix_user_logs_date', 'date'),
        Index('ix_user_logs_user_date', 'user_id', 'date'),
        UniqueConstraint('user_id', 'date', name='uq_user_logs_user_date'),
        CheckConstraint(
            'symptom_energy IS NULL OR (symptom_energy >= 0 AND symptom_energy <= 5)',
            name='ck_symptom_energy_range'
        ),
        CheckConstraint(
            'symptom_bloating IS NULL OR (symptom_bloating >= 0 AND symptom_bloating <= 5)',
            name='ck_symptom_bloating_range'
        ),
        CheckConstraint(
            'symptom_focus IS NULL OR (symptom_focus >= 0 AND symptom_focus <= 5)',
            name='ck_symptom_focus_range'
        ),
        CheckConstraint(
            'symptom_mood IS NULL OR (symptom_mood >= 0 AND symptom_mood <= 5)',
            name='ck_symptom_mood_range'
        ),
        CheckConstraint(
            'symptom_sleep IS NULL OR (symptom_sleep >= 0 AND symptom_sleep <= 5)',
            name='ck_symptom_sleep_range'
        ),
    )

    def __repr__(self):
        return f"<UserLog {self.date} - {self.user_id}>"

    @property
    def symptoms_dict(self) -> dict:
        """Return symptoms as dictionary for API compatibility."""
        return {
            'energy': self.symptom_energy,
            'bloating': self.symptom_bloating,
            'focus': self.symptom_focus,
            'mood': self.symptom_mood,
            'sleep': self.symptom_sleep,
        }

    def set_symptoms_from_dict(self, symptoms: dict):
        """Set individual symptom columns from dictionary."""
        self.symptom_energy = symptoms.get('energy')
        self.symptom_bloating = symptoms.get('bloating')
        self.symptom_focus = symptoms.get('focus')
        self.symptom_mood = symptoms.get('mood')
        self.symptom_sleep = symptoms.get('sleep')
        # Also store in legacy field for backwards compatibility
        self.symptoms = symptoms


class IngredientScore(Base):
    """
    Cached health scores for ingredients.
    Populated by the scoring service.
    """
    __tablename__ = "ingredient_scores"

    id = Column(GUID(), primary_key=True, default=uuid.uuid4)
    ingredient_name = Column(String(255), unique=True, nullable=False, index=True)

    # Health impact scores (0-100 scale)
    blood_sugar_impact = Column(Integer, nullable=True)
    inflammation_potential = Column(Integer, nullable=True)
    gut_impact = Column(Integer, nullable=True)
    overall_score = Column(Integer, nullable=True)

    # Hormonal relevance
    hormonal_relevance = Column(JSONType(), nullable=True)

    # Evidence quality
    evidence_confidence = Column(String(20), nullable=True)

    # Source citations
    sources = Column(JSONType(), default=list)

    cached_at = Column(DateTime, default=datetime.utcnow)
    updated_at = Column(DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)

    def __repr__(self):
        return f"<IngredientScore {self.ingredient_name}>"


class Prediction(Base):
    """
    ML model predictions for a user.
    Stores predicted symptom outcomes based on ingredients.
    """
    __tablename__ = "predictions"

    id = Column(GUID(), primary_key=True, default=uuid.uuid4)
    user_id = Column(GUID(), ForeignKey("users.id", ondelete="CASCADE"), nullable=False)

    predicted_date = Column(Date, nullable=True)
    ingredients = Column(JSONType(), default=list)
    cycle_phase = Column(String(50), nullable=True)

    # Prediction results
    predicted_bloating_probability = Column(Float, nullable=True)
    predicted_symptoms = Column(JSONType(), nullable=True)

    confidence = Column(String(20), nullable=True)
    interpretation = Column(String(500), nullable=True)

    created_at = Column(DateTime, default=datetime.utcnow)

    # Relationships
    user = relationship("User", back_populates="predictions")

    # Table indexes
    __table_args__ = (
        Index('ix_predictions_user_id', 'user_id'),
        Index('ix_predictions_user_date', 'user_id', 'predicted_date'),
    )

    def __repr__(self):
        return f"<Prediction {self.predicted_date} - {self.user_id}>"


class UserInsight(Base):
    """
    Cached user insights from correlation analysis.
    Stores pre-computed ingredient-symptom correlations and patterns.
    Updated by background analysis jobs.
    """
    __tablename__ = "user_insights"

    id = Column(GUID(), primary_key=True, default=uuid.uuid4)
    user_id = Column(GUID(), ForeignKey("users.id", ondelete="CASCADE"), nullable=False)

    # Insight classification
    insight_type = Column(String(50), nullable=False)
    # Values: 'trigger', 'phase_pattern', 'lag_effect', 'recommendation'

    # Related entities
    ingredient_name = Column(String(255), nullable=True)
    symptom_name = Column(String(50), nullable=True)

    # Statistical measures
    correlation_score = Column(Float, nullable=True)
    confidence_level = Column(String(20), nullable=True)
    sample_size = Column(Integer, nullable=True)
    p_value = Column(Float, nullable=True)

    # Flexible data storage
    insight_data = Column(JSONType(), default=dict)

    # Validity period
    valid_from = Column(Date, nullable=False)
    valid_until = Column(Date, nullable=False)

    # Metadata
    computed_at = Column(DateTime, default=datetime.utcnow, nullable=False)
    is_active = Column(Boolean, default=True, nullable=False)

    created_at = Column(DateTime, default=datetime.utcnow)
    updated_at = Column(DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)

    # Relationships
    user = relationship("User", back_populates="insights")

    # Table constraints and indexes
    __table_args__ = (
        Index('ix_user_insights_user_id', 'user_id'),
        Index('ix_user_insights_user_type_active', 'user_id', 'insight_type', 'is_active'),
        Index('ix_user_insights_ingredient', 'ingredient_name'),
        CheckConstraint(
            "insight_type IN ('trigger', 'phase_pattern', 'lag_effect', 'recommendation')",
            name='ck_insight_type_valid'
        ),
        CheckConstraint(
            "confidence_level IN ('high', 'medium', 'low') OR confidence_level IS NULL",
            name='ck_confidence_level_valid'
        ),
        CheckConstraint(
            'correlation_score IS NULL OR (correlation_score >= -1.0 AND correlation_score <= 1.0)',
            name='ck_correlation_score_range'
        ),
        CheckConstraint(
            'sample_size IS NULL OR sample_size >= 0',
            name='ck_sample_size_positive'
        ),
    )

    def __repr__(self):
        return f"<UserInsight {self.insight_type}: {self.ingredient_name} -> {self.symptom_name}>"
```

---

## Document History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2026-01-20 | Database Engineering Team | Initial version |

---

*This document should be reviewed and updated as the schema evolves. All migrations should be tested in staging before production deployment.*
