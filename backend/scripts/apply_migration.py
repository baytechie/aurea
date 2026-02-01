#!/usr/bin/env python3
"""
Apply database migration for comprehensive ingredient fields.

This script adds the new columns to ingredient_scores table for both
SQLite (development) and PostgreSQL (production).

Usage:
    python scripts/apply_migration.py
"""

import os
import sys
from pathlib import Path

# Add parent to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

# Load environment if available
try:
    from dotenv import load_dotenv
    load_dotenv()
except ImportError:
    pass

from sqlalchemy import create_engine, text, inspect

# Get database URL
DATABASE_URL = os.environ.get('DATABASE_URL', 'sqlite:///./aurea.db')


def get_existing_columns(engine, table_name):
    """Get list of existing column names in a table."""
    inspector = inspect(engine)
    try:
        columns = inspector.get_columns(table_name)
        return {col['name'] for col in columns}
    except Exception:
        return set()


def apply_migration():
    """Apply schema migration to add new ingredient fields."""

    if DATABASE_URL.startswith("sqlite"):
        engine = create_engine(DATABASE_URL, connect_args={"check_same_thread": False})
    else:
        engine = create_engine(DATABASE_URL)

    is_sqlite = 'sqlite' in DATABASE_URL.lower()

    # Check existing columns
    existing_columns = get_existing_columns(engine, 'ingredient_scores')

    if not existing_columns:
        print("Table 'ingredient_scores' does not exist. Run the app to create it first.")
        return

    print(f"Existing columns: {sorted(existing_columns)}")

    # New columns to add
    new_columns = {
        'category': 'VARCHAR(100)',
        'disease_links': 'INTEGER',
        'blood_sugar_details': 'TEXT',
        'inflammation_details': 'TEXT',
        'gut_impact_details': 'TEXT',
        'disease_links_details': 'TEXT',
        'is_trusted': 'INTEGER DEFAULT 0',
    }

    with engine.connect() as conn:
        for col_name, col_type in new_columns.items():
            if col_name not in existing_columns:
                try:
                    if is_sqlite:
                        sql = f"ALTER TABLE ingredient_scores ADD COLUMN {col_name} {col_type}"
                    else:
                        # PostgreSQL
                        if col_type == 'TEXT':
                            pg_type = 'TEXT'
                        elif col_type == 'INTEGER':
                            pg_type = 'INTEGER'
                        elif col_type == 'INTEGER DEFAULT 0':
                            pg_type = 'INTEGER DEFAULT 0'
                        elif 'VARCHAR' in col_type:
                            pg_type = col_type
                        else:
                            pg_type = col_type
                        sql = f"ALTER TABLE ingredient_scores ADD COLUMN {col_name} {pg_type}"

                    conn.execute(text(sql))
                    print(f"✅ Added column: {col_name}")
                except Exception as e:
                    print(f"⚠️  Could not add column {col_name}: {e}")
            else:
                print(f"✓  Column already exists: {col_name}")

        conn.commit()

    # Verify the migration
    updated_columns = get_existing_columns(engine, 'ingredient_scores')
    print(f"\nUpdated columns: {sorted(updated_columns)}")

    missing = set(new_columns.keys()) - updated_columns
    if missing:
        print(f"\n⚠️  Still missing columns: {missing}")
    else:
        print("\n✅ All required columns are present!")


if __name__ == "__main__":
    apply_migration()
