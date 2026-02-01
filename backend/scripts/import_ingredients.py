#!/usr/bin/env python3
"""
Aurea Ingredients Database Import Script

Imports the comprehensive ingredients health database into Aurea's ingredient_scores table.
Works with both SQLite (development) and PostgreSQL (production).

Usage:
    # From backend directory:
    python scripts/import_ingredients.py

    # Or with specific database URL:
    DATABASE_URL=postgresql://... python scripts/import_ingredients.py

Data source: User's research (30 fully trusted) + public databases (480 less trusted)
"""

import sys
import os
import json
import uuid
from datetime import datetime, timezone
from pathlib import Path

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

from sqlalchemy import create_engine, text
from sqlalchemy.orm import sessionmaker

# Try to import from app, fall back to inline if not available
try:
    from app.core.config import settings
    DATABASE_URL = settings.DATABASE_URL
except ImportError:
    DATABASE_URL = os.getenv("DATABASE_URL", "sqlite:///./aurea.db")


def calculate_aurea_overall_score(blood_sugar: int, inflammation_potential: int,
                                   gut_impact: int, hormonal_score: int) -> int:
    """
    Calculate overall score using Aurea's formula.

    Note: inflammation_potential is already inverted (higher = worse),
    so we use (100 - inflammation_potential) in the calculation.
    """
    overall = (
        blood_sugar * 0.30 +
        (100 - inflammation_potential) * 0.30 +  # Invert back for calculation
        gut_impact * 0.25 +
        (100 - hormonal_score) * 0.15  # Lower hormonal impact is better
    )
    return int(round(overall))


def map_confidence(score: int) -> str:
    """Map numeric confidence score to Aurea's confidence levels."""
    if score >= 80:
        return "high"
    elif score >= 60:
        return "medium"
    else:
        return "low"


def get_hormonal_relevance(hormonal_score: int, category: str) -> dict:
    """Generate hormonal relevance JSON based on score and category."""
    # Determine impact levels
    if hormonal_score >= 75:
        overall_impact = "low"  # Higher score = less hormonal disruption
        insulin_impact = "low"
        estrogen_impact = "low"
    elif hormonal_score >= 50:
        overall_impact = "moderate"
        insulin_impact = "moderate"
        estrogen_impact = "moderate" if category in ["Dairy & Alternatives", "Proteins"] else "low"
    else:
        overall_impact = "high"
        insulin_impact = "high"
        estrogen_impact = "moderate"

    # Special cases by category
    if category == "Sweeteners":
        insulin_impact = "high" if hormonal_score < 60 else "moderate"
    elif category == "Dairy & Alternatives":
        estrogen_impact = "moderate"

    return {
        "score": 100 - hormonal_score,  # Invert: their score means impact level
        "insulin_impact": insulin_impact,
        "estrogen_impact": estrogen_impact,
        "cortisol_impact": "low" if hormonal_score >= 60 else "moderate"
    }


def parse_sources(sources_str: str) -> list:
    """Convert sources string to JSON array format."""
    if not sources_str:
        return []

    sources = []
    for source in sources_str.split(", "):
        source = source.strip()
        if source:
            # Map common sources to proper format
            source_mapping = {
                "PubMed": {"name": "PubMed/NCBI", "type": "research"},
                "USDA": {"name": "USDA FoodData Central", "type": "database"},
                "Harvard Health": {"name": "Harvard T.H. Chan School of Public Health", "type": "institution"},
                "Harvard Nutrition Source": {"name": "Harvard Nutrition Source", "type": "institution"},
                "Healthline": {"name": "Healthline", "type": "health_media"},
                "WebMD": {"name": "WebMD", "type": "health_media"},
                "Mayo Clinic": {"name": "Mayo Clinic", "type": "institution"},
                "Cleveland Clinic": {"name": "Cleveland Clinic", "type": "institution"},
                "Examine.com": {"name": "Examine.com", "type": "research"},
                "FDA": {"name": "U.S. Food & Drug Administration", "type": "regulatory"},
                "EFSA": {"name": "European Food Safety Authority", "type": "regulatory"},
                "Nature": {"name": "Nature", "type": "journal"},
                "BMJ": {"name": "British Medical Journal", "type": "journal"},
                "ScienceDirect": {"name": "ScienceDirect", "type": "research"},
            }

            if source in source_mapping:
                sources.append(source_mapping[source])
            else:
                sources.append({"name": source, "type": "other"})

    return sources


def load_ingredients_data():
    """Load ingredient data from JSON file."""
    # Try multiple locations
    possible_paths = [
        Path(__file__).parent.parent / "data" / "Aurea_Ingredients_Database.json",
        Path(__file__).parent.parent.parent.parent / "mnt" / "outputs" / "Aurea_Ingredients_Database.json",
        Path("/sessions/charming-serene-gates/mnt/outputs/Aurea_Ingredients_Database.json"),
    ]

    json_path = None
    for path in possible_paths:
        if path.exists():
            json_path = path
            break

    if not json_path:
        print(f"Error: Could not find ingredients database")
        print("Searched in:")
        for p in possible_paths:
            print(f"  - {p}")
        sys.exit(1)

    print(f"      Found at: {json_path}")
    with open(json_path, 'r') as f:
        return json.load(f)


def transform_ingredient(ing: dict) -> dict:
    """Transform ingredient from research format to Aurea schema."""
    # Map my inflammation score (higher = less inflammatory/better)
    # to Aurea's inflammation_potential (higher = MORE inflammatory/worse)
    inflammation_potential = 100 - ing["inflammation_score"]

    # Get hormonal relevance JSON
    hormonal_relevance = get_hormonal_relevance(
        ing["hormonal_score"],
        ing["category"]
    )

    # Calculate overall score using Aurea's formula
    overall_score = calculate_aurea_overall_score(
        ing["blood_sugar_score"],
        inflammation_potential,
        ing["gut_impact_score"],
        ing["hormonal_score"]
    )

    # Average confidence from all scores
    avg_confidence = (
        ing["blood_sugar_confidence"] +
        ing["inflammation_confidence"] +
        ing["gut_confidence"] +
        ing["disease_confidence"] +
        ing["hormonal_confidence"]
    ) // 5

    # Parse sources
    sources = parse_sources(ing["sources"])

    # Add trust level to sources
    if ing["trust_level"] == "Fully Trusted":
        sources.insert(0, {"name": "User Research (Verified)", "type": "primary", "trusted": True})
    else:
        sources.insert(0, {"name": "Public Database (Derived)", "type": "secondary", "trusted": False})

    return {
        "ingredient_name": ing["name"].lower(),  # Normalize to lowercase
        "blood_sugar_impact": ing["blood_sugar_score"],
        "inflammation_potential": inflammation_potential,
        "gut_impact": ing["gut_impact_score"],
        "overall_score": overall_score,
        "hormonal_relevance": hormonal_relevance,
        "evidence_confidence": map_confidence(avg_confidence),
        "sources": sources,
        "category": ing["category"],  # Extra metadata
        "subcategory": ing["subcategory"],
        "notes": ing["notes"],
        "trust_level": ing["trust_level"],
        "original_composite": ing["composite_score"],  # For reference
    }


def import_to_database(ingredients: list, engine):
    """Import ingredients into the database using SQLAlchemy."""
    Session = sessionmaker(bind=engine)
    session = Session()

    # Detect database type
    is_postgres = "postgresql" in str(engine.url)

    imported = 0
    updated = 0
    errors = 0

    try:
        for ing in ingredients:
            try:
                # Check if ingredient already exists
                if is_postgres:
                    check_sql = text("""
                        SELECT id FROM ingredient_scores
                        WHERE LOWER(ingredient_name) = LOWER(:name)
                    """)
                else:
                    check_sql = text("""
                        SELECT id FROM ingredient_scores
                        WHERE LOWER(ingredient_name) = LOWER(:name)
                    """)

                result = session.execute(check_sql, {"name": ing["ingredient_name"]}).fetchone()

                now = datetime.now(timezone.utc)

                if result:
                    # Update existing record
                    update_sql = text("""
                        UPDATE ingredient_scores SET
                            blood_sugar_impact = :blood_sugar_impact,
                            inflammation_potential = :inflammation_potential,
                            gut_impact = :gut_impact,
                            overall_score = :overall_score,
                            hormonal_relevance = :hormonal_relevance,
                            evidence_confidence = :evidence_confidence,
                            sources = :sources,
                            updated_at = :updated_at
                        WHERE id = :id
                    """)
                    session.execute(update_sql, {
                        "id": str(result[0]),
                        "blood_sugar_impact": ing["blood_sugar_impact"],
                        "inflammation_potential": ing["inflammation_potential"],
                        "gut_impact": ing["gut_impact"],
                        "overall_score": ing["overall_score"],
                        "hormonal_relevance": json.dumps(ing["hormonal_relevance"]),
                        "evidence_confidence": ing["evidence_confidence"],
                        "sources": json.dumps(ing["sources"]),
                        "updated_at": now,
                    })
                    updated += 1
                else:
                    # Insert new record
                    new_id = str(uuid.uuid4())
                    insert_sql = text("""
                        INSERT INTO ingredient_scores (
                            id, ingredient_name, blood_sugar_impact, inflammation_potential,
                            gut_impact, overall_score, hormonal_relevance, evidence_confidence,
                            sources, cached_at, updated_at
                        ) VALUES (
                            :id, :ingredient_name, :blood_sugar_impact, :inflammation_potential,
                            :gut_impact, :overall_score, :hormonal_relevance, :evidence_confidence,
                            :sources, :cached_at, :updated_at
                        )
                    """)
                    session.execute(insert_sql, {
                        "id": new_id,
                        "ingredient_name": ing["ingredient_name"],
                        "blood_sugar_impact": ing["blood_sugar_impact"],
                        "inflammation_potential": ing["inflammation_potential"],
                        "gut_impact": ing["gut_impact"],
                        "overall_score": ing["overall_score"],
                        "hormonal_relevance": json.dumps(ing["hormonal_relevance"]),
                        "evidence_confidence": ing["evidence_confidence"],
                        "sources": json.dumps(ing["sources"]),
                        "cached_at": now,
                        "updated_at": now,
                    })
                    imported += 1

            except Exception as e:
                errors += 1
                print(f"  Error with {ing['ingredient_name']}: {e}")

        session.commit()
        print(f"\n✓ Import complete!")
        print(f"  - New ingredients: {imported}")
        print(f"  - Updated: {updated}")
        print(f"  - Errors: {errors}")

    except Exception as e:
        session.rollback()
        print(f"Error during import: {e}")
        raise
    finally:
        session.close()


def generate_sql_files(ingredients: list):
    """Generate SQL import files for both SQLite and PostgreSQL."""
    output_dir = Path(__file__).parent / "sql"
    output_dir.mkdir(exist_ok=True)

    # SQLite SQL
    sqlite_sql = []
    sqlite_sql.append("-- Aurea Ingredients Database Import (SQLite)")
    sqlite_sql.append("-- Generated: " + datetime.now().isoformat())
    sqlite_sql.append("-- Total: " + str(len(ingredients)) + " ingredients")
    sqlite_sql.append("")
    sqlite_sql.append("BEGIN TRANSACTION;")
    sqlite_sql.append("")

    # PostgreSQL SQL
    postgres_sql = []
    postgres_sql.append("-- Aurea Ingredients Database Import (PostgreSQL)")
    postgres_sql.append("-- Generated: " + datetime.now().isoformat())
    postgres_sql.append("-- Total: " + str(len(ingredients)) + " ingredients")
    postgres_sql.append("")
    postgres_sql.append("BEGIN;")
    postgres_sql.append("")

    for ing in ingredients:
        # Escape single quotes
        name = ing["ingredient_name"].replace("'", "''")
        hormonal_json = json.dumps(ing["hormonal_relevance"]).replace("'", "''")
        sources_json = json.dumps(ing["sources"]).replace("'", "''")

        # SQLite INSERT with uuid as string
        sqlite_sql.append(f"""
INSERT OR REPLACE INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    '{str(uuid.uuid4())}',
    '{name}',
    {ing["blood_sugar_impact"]},
    {ing["inflammation_potential"]},
    {ing["gut_impact"]},
    {ing["overall_score"]},
    '{hormonal_json}',
    '{ing["evidence_confidence"]}',
    '{sources_json}',
    datetime('now'),
    datetime('now')
);""")

        # PostgreSQL UPSERT
        postgres_sql.append(f"""
INSERT INTO ingredient_scores (
    id, ingredient_name, blood_sugar_impact, inflammation_potential,
    gut_impact, overall_score, hormonal_relevance, evidence_confidence,
    sources, cached_at, updated_at
) VALUES (
    gen_random_uuid(),
    '{name}',
    {ing["blood_sugar_impact"]},
    {ing["inflammation_potential"]},
    {ing["gut_impact"]},
    {ing["overall_score"]},
    '{hormonal_json}'::jsonb,
    '{ing["evidence_confidence"]}',
    '{sources_json}'::jsonb,
    NOW(),
    NOW()
)
ON CONFLICT (ingredient_name) DO UPDATE SET
    blood_sugar_impact = EXCLUDED.blood_sugar_impact,
    inflammation_potential = EXCLUDED.inflammation_potential,
    gut_impact = EXCLUDED.gut_impact,
    overall_score = EXCLUDED.overall_score,
    hormonal_relevance = EXCLUDED.hormonal_relevance,
    evidence_confidence = EXCLUDED.evidence_confidence,
    sources = EXCLUDED.sources,
    updated_at = NOW();""")

    sqlite_sql.append("")
    sqlite_sql.append("COMMIT;")

    postgres_sql.append("")
    postgres_sql.append("COMMIT;")

    # Write files
    sqlite_path = output_dir / "import_ingredients_sqlite.sql"
    postgres_path = output_dir / "import_ingredients_postgres.sql"

    with open(sqlite_path, 'w') as f:
        f.write("\n".join(sqlite_sql))

    with open(postgres_path, 'w') as f:
        f.write("\n".join(postgres_sql))

    print(f"Generated SQL files:")
    print(f"  - SQLite:     {sqlite_path}")
    print(f"  - PostgreSQL: {postgres_path}")

    return sqlite_path, postgres_path


def main():
    print("=" * 60)
    print("AUREA INGREDIENTS DATABASE IMPORT")
    print("=" * 60)

    # Load data
    print("\n[1/4] Loading ingredients data...")
    raw_ingredients = load_ingredients_data()
    print(f"      Loaded {len(raw_ingredients)} ingredients")

    # Transform data
    print("\n[2/4] Transforming to Aurea schema...")
    transformed = [transform_ingredient(ing) for ing in raw_ingredients]

    trusted_count = len([i for i in raw_ingredients if i["trust_level"] == "Fully Trusted"])
    print(f"      - Fully Trusted (User Research): {trusted_count}")
    print(f"      - Less Trusted (Public Sources): {len(transformed) - trusted_count}")

    # Generate SQL files
    print("\n[3/4] Generating SQL import files...")
    generate_sql_files(transformed)

    # Import to database
    print(f"\n[4/4] Importing to database...")
    print(f"      Database: {DATABASE_URL[:50]}...")

    try:
        engine = create_engine(DATABASE_URL)

        # Check if table exists
        with engine.connect() as conn:
            if "sqlite" in DATABASE_URL:
                result = conn.execute(text(
                    "SELECT name FROM sqlite_master WHERE type='table' AND name='ingredient_scores'"
                )).fetchone()
            else:
                result = conn.execute(text(
                    "SELECT tablename FROM pg_tables WHERE tablename='ingredient_scores'"
                )).fetchone()

            if not result:
                print("      ⚠ Table 'ingredient_scores' does not exist!")
                print("      Please run database migrations first:")
                print("        cd backend && alembic upgrade head")
                print("\n      Or create the table manually using the SQL files generated above.")
                return

        import_to_database(transformed, engine)

    except Exception as e:
        print(f"      Error connecting to database: {e}")
        print("      SQL files have been generated - you can import manually.")

    print("\n" + "=" * 60)
    print("IMPORT COMPLETE!")
    print("=" * 60)


if __name__ == "__main__":
    main()
