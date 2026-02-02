#!/usr/bin/env python3
"""
Apply database migration to add Apple authentication columns.

This script adds the following columns to the users table:
- apple_user_id: Unique identifier from Apple Sign-In
- auth_provider: Authentication provider ('email', 'apple')
- Makes password_hash nullable for social login users

Usage:
    python scripts/add_apple_auth_columns.py

Supports both SQLite (development) and PostgreSQL (production).
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
    """Apply schema migration to add Apple authentication columns."""

    print(f"Connecting to database...")
    print(f"Using {'SQLite' if 'sqlite' in DATABASE_URL.lower() else 'PostgreSQL'}")

    if DATABASE_URL.startswith("sqlite"):
        engine = create_engine(DATABASE_URL, connect_args={"check_same_thread": False})
    else:
        engine = create_engine(DATABASE_URL)

    is_sqlite = 'sqlite' in DATABASE_URL.lower()

    # Check existing columns
    existing_columns = get_existing_columns(engine, 'users')

    if not existing_columns:
        print("Table 'users' does not exist. Run the app to create it first.")
        return

    print(f"Existing columns: {sorted(existing_columns)}")

    # New columns to add for Apple authentication
    new_columns = {
        'apple_user_id': 'VARCHAR(255)',
        'auth_provider': "VARCHAR(50) DEFAULT 'email' NOT NULL" if not is_sqlite else "VARCHAR(50) DEFAULT 'email'",
    }

    with engine.connect() as conn:
        for col_name, col_type in new_columns.items():
            if col_name not in existing_columns:
                try:
                    if is_sqlite:
                        sql = f"ALTER TABLE users ADD COLUMN {col_name} {col_type}"
                    else:
                        # PostgreSQL
                        sql = f"ALTER TABLE users ADD COLUMN {col_name} {col_type}"

                    conn.execute(text(sql))
                    print(f"Added column: {col_name}")
                except Exception as e:
                    print(f"Could not add column {col_name}: {e}")
            else:
                print(f"Column already exists: {col_name}")

        # Create unique index on apple_user_id if it doesn't exist
        if 'apple_user_id' not in existing_columns:
            try:
                if is_sqlite:
                    # SQLite: Create unique index
                    conn.execute(text(
                        "CREATE UNIQUE INDEX IF NOT EXISTS ix_users_apple_user_id ON users (apple_user_id)"
                    ))
                else:
                    # PostgreSQL: Create unique index
                    conn.execute(text(
                        "CREATE UNIQUE INDEX IF NOT EXISTS ix_users_apple_user_id ON users (apple_user_id)"
                    ))
                print("Created unique index on apple_user_id")
            except Exception as e:
                print(f"Could not create index on apple_user_id: {e}")

        # For SQLite, we cannot modify the NOT NULL constraint on password_hash
        # The model change (nullable=True) will apply to new records
        # Existing users already have passwords, so this is fine

        # For PostgreSQL, we can alter the column to be nullable
        if not is_sqlite:
            try:
                conn.execute(text(
                    "ALTER TABLE users ALTER COLUMN password_hash DROP NOT NULL"
                ))
                print("Made password_hash nullable")
            except Exception as e:
                # This might fail if already nullable or if column doesn't exist
                print(f"Note: Could not modify password_hash: {e}")

        conn.commit()

    # Verify the migration
    updated_columns = get_existing_columns(engine, 'users')
    print(f"\nUpdated columns: {sorted(updated_columns)}")

    missing = set(new_columns.keys()) - updated_columns
    if missing:
        print(f"\nStill missing columns: {missing}")
    else:
        print("\nAll Apple auth columns are present!")


if __name__ == "__main__":
    apply_migration()
