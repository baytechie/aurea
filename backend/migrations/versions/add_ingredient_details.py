"""Add detailed ingredient fields for comprehensive health research data.

Revision ID: add_ingredient_details_001
Revises: (auto-detected)
Create Date: 2026-02-01

This migration adds new columns to ingredient_scores to support:
- Category classification (Sweeteners, Fats & Oils, etc.)
- Disease links score (separate from overall)
- Detailed descriptions for each health category (as JSON)
- Per-category evidence confidence levels
- Trusted vs less-trusted ingredient flag
"""

from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import postgresql

# revision identifiers
revision = 'add_ingredient_details_001'
down_revision = None  # Update this to your current head revision
branch_labels = None
depends_on = None


def upgrade():
    # Add new columns to ingredient_scores table
    with op.batch_alter_table('ingredient_scores') as batch_op:
        # Category classification
        batch_op.add_column(sa.Column('category', sa.String(100), nullable=True))

        # Disease links score (was missing from original schema)
        batch_op.add_column(sa.Column('disease_links', sa.Integer(), nullable=True))

        # Detailed descriptions for each health category (JSON)
        batch_op.add_column(sa.Column('blood_sugar_details', sa.Text(), nullable=True))
        batch_op.add_column(sa.Column('inflammation_details', sa.Text(), nullable=True))
        batch_op.add_column(sa.Column('gut_impact_details', sa.Text(), nullable=True))
        batch_op.add_column(sa.Column('disease_links_details', sa.Text(), nullable=True))

        # Trust level (1 = fully trusted research, 0 = less trusted/public sources)
        batch_op.add_column(sa.Column('is_trusted', sa.Integer(), nullable=True, server_default='0'))


def downgrade():
    with op.batch_alter_table('ingredient_scores') as batch_op:
        batch_op.drop_column('category')
        batch_op.drop_column('disease_links')
        batch_op.drop_column('blood_sugar_details')
        batch_op.drop_column('inflammation_details')
        batch_op.drop_column('gut_impact_details')
        batch_op.drop_column('disease_links_details')
        batch_op.drop_column('is_trusted')
