#!/usr/bin/env python3
"""
Run SQL import against production database.
Usage: python scripts/run_sql_import.py <sql_file> <database_url>
"""

import sys
import psycopg2


def run_sql_import(sql_file: str, database_url: str):
    """Execute SQL file against PostgreSQL database."""
    print(f"Reading SQL file: {sql_file}")

    with open(sql_file, 'r') as f:
        sql_content = f.read()

    print(f"SQL file size: {len(sql_content):,} bytes")

    print(f"Connecting to database...")
    conn = psycopg2.connect(database_url)
    conn.autocommit = False
    cursor = conn.cursor()

    try:
        print("Executing SQL...")
        cursor.execute(sql_content)
        conn.commit()
        print("✅ SQL executed successfully!")

        # Verify import
        cursor.execute("SELECT COUNT(*) FROM ingredient_scores")
        total = cursor.fetchone()[0]

        cursor.execute("SELECT COUNT(*) FROM ingredient_scores WHERE is_trusted = 1")
        trusted = cursor.fetchone()[0]

        cursor.execute("SELECT COUNT(DISTINCT category) FROM ingredient_scores WHERE category IS NOT NULL")
        categories = cursor.fetchone()[0]

        print(f"\n📊 Database Status:")
        print(f"   Total ingredients: {total}")
        print(f"   Trusted ingredients: {trusted}")
        print(f"   Categories: {categories}")

    except Exception as e:
        conn.rollback()
        print(f"❌ Error: {e}")
        sys.exit(1)
    finally:
        cursor.close()
        conn.close()


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python run_sql_import.py <sql_file> <database_url>")
        sys.exit(1)

    sql_file = sys.argv[1]
    database_url = sys.argv[2]

    run_sql_import(sql_file, database_url)
