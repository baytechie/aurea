"""
Aurea Admin Dashboard
A Streamlit-based admin interface for visualizing ingredient data and performing data analysis.

Authentication:
- All pages are protected behind JWT authentication
- Users must sign in with their existing Aurea credentials
- Tokens are validated against the same secret used by the backend API
"""

import streamlit as st
import pandas as pd
import plotly.express as px
import plotly.graph_objects as go
from plotly.subplots import make_subplots
import sqlite3
from pathlib import Path
import sys
import os
from sqlalchemy import create_engine, text

# Import authentication module
from auth import (
    init_session_state,
    is_authenticated,
    get_current_user,
    show_login_form,
    show_logout_button,
    require_auth
)

# Add backend to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent / "backend"))

# Database configuration
DATABASE_URL = os.environ.get("DATABASE_URL", "")

# Page config - must be first Streamlit command
st.set_page_config(
    page_title="Aurea Admin Dashboard",
    page_icon="",
    layout="wide",
    initial_sidebar_state="expanded"
)

# Initialize authentication session state
init_session_state()

# Custom CSS
st.markdown("""
<style>
    .main-header {
        font-size: 2.5rem;
        font-weight: 700;
        color: #2E7D32;
        margin-bottom: 0.5rem;
    }
    .sub-header {
        font-size: 1.1rem;
        color: #666;
        margin-bottom: 2rem;
    }
    .metric-card {
        background: linear-gradient(135deg, #E8F5E9 0%, #C8E6C9 100%);
        padding: 1.5rem;
        border-radius: 12px;
        border-left: 4px solid #2E7D32;
    }
    .stMetric {
        background-color: #f8f9fa;
        padding: 1rem;
        border-radius: 8px;
    }
    /* Login form styling */
    .login-container {
        max-width: 400px;
        margin: 0 auto;
        padding: 2rem;
    }
</style>
""", unsafe_allow_html=True)


def get_db_connection():
    """Get database connection - supports PostgreSQL (production) and SQLite (local)."""
    if DATABASE_URL:
        # Production: Use PostgreSQL via DATABASE_URL
        # Render uses postgres:// but SQLAlchemy needs postgresql://
        db_url = DATABASE_URL.replace("postgres://", "postgresql://", 1)
        return create_engine(db_url)
    else:
        # Local development: Use SQLite
        possible_paths = [
            Path(__file__).parent.parent / "backend" / "aurea.db",
            Path("/tmp/aurea.db"),
            Path(__file__).parent.parent / "backend" / "app" / "aurea.db",
        ]
        for path in possible_paths:
            if path.exists():
                return create_engine(f"sqlite:///{path}")
        return create_engine(f"sqlite:///{possible_paths[0]}")


def get_db_path():
    """Get the database path for SQLite - used for local development only."""
    possible_paths = [
        Path(__file__).parent.parent / "backend" / "aurea.db",
        Path("/tmp/aurea.db"),
        Path(__file__).parent.parent / "backend" / "app" / "aurea.db",
    ]
    for path in possible_paths:
        if path.exists():
            return str(path)
    return str(possible_paths[0])


def load_ingredients_data():
    """Load ingredient scores from database."""
    try:
        engine = get_db_connection()
        query = """
            SELECT
                ingredient_name,
                blood_sugar_impact,
                inflammation_potential,
                gut_impact,
                overall_score,
                hormonal_relevance,
                evidence_confidence,
                sources,
                cached_at,
                updated_at
            FROM ingredient_scores
            ORDER BY overall_score DESC
        """
        df = pd.read_sql_query(query, engine)
        return df
    except Exception as e:
        st.error(f"Database error: {e}")
        return pd.DataFrame()


def load_user_logs():
    """Load user logs from database."""
    try:
        engine = get_db_connection()
        query = """
            SELECT
                ul.id,
                ul.user_id,
                ul.date,
                ul.ingredients,
                ul.symptom_energy,
                ul.symptom_bloating,
                ul.symptom_focus,
                ul.symptom_mood,
                ul.symptom_sleep,
                ul.cycle_phase,
                u.email
            FROM user_logs ul
            LEFT JOIN users u ON ul.user_id = u.id
            ORDER BY ul.date DESC
        """
        df = pd.read_sql_query(query, engine)
        return df
    except Exception as e:
        st.error(f"Database error: {e}")
        return pd.DataFrame()


def load_users():
    """Load users from database."""
    try:
        engine = get_db_connection()
        query = "SELECT id, email, created_at, cycle_enabled FROM users"
        df = pd.read_sql_query(query, engine)
        return df
    except Exception as e:
        st.error(f"Database error: {e}")
        return pd.DataFrame()


def main():
    """Main application entry point."""
    # Check authentication first
    if not is_authenticated():
        # Show login form for unauthenticated users
        show_login_form()
        return

    # User is authenticated - show the dashboard
    show_authenticated_app()


def show_authenticated_app():
    """Show the main authenticated application."""
    # Sidebar navigation
    st.sidebar.markdown("## Aurea Admin")
    st.sidebar.markdown("---")

    page = st.sidebar.radio(
        "Navigation",
        ["Dashboard", "Ingredients", "Analytics", "Python Console"],
        label_visibility="collapsed"
    )

    st.sidebar.markdown("---")
    st.sidebar.markdown("### Database Info")
    if DATABASE_URL:
        st.sidebar.success("PostgreSQL (Production)")
        st.sidebar.caption("Connected via DATABASE_URL")
    else:
        db_path = get_db_path()
        if Path(db_path).exists():
            st.sidebar.success("SQLite (Local)")
            st.sidebar.caption(f"Path: {db_path}")
        else:
            st.sidebar.error("Database not found")

    # Show logout button in sidebar
    show_logout_button()

    # Page routing
    if page == "Dashboard":
        show_dashboard()
    elif page == "Ingredients":
        show_ingredients()
    elif page == "Analytics":
        show_analytics()
    elif page == "Python Console":
        show_python_console()


def show_dashboard():
    """Main dashboard overview."""
    st.markdown('<p class="main-header">Dashboard Overview</p>', unsafe_allow_html=True)
    st.markdown('<p class="sub-header">Real-time insights into your Aurea data</p>', unsafe_allow_html=True)

    # Load data
    ingredients_df = load_ingredients_data()
    users_df = load_users()
    logs_df = load_user_logs()

    # Key metrics
    col1, col2, col3, col4 = st.columns(4)

    with col1:
        st.metric(
            label="Total Ingredients",
            value=len(ingredients_df),
            delta="Scored"
        )

    with col2:
        st.metric(
            label="Total Users",
            value=len(users_df),
            delta="Registered"
        )

    with col3:
        st.metric(
            label="Total Logs",
            value=len(logs_df),
            delta="Entries"
        )

    with col4:
        avg_score = ingredients_df['overall_score'].mean() if len(ingredients_df) > 0 else 0
        st.metric(
            label="Avg Health Score",
            value=f"{avg_score:.1f}",
            delta="out of 100"
        )

    st.markdown("---")

    # Charts row
    if len(ingredients_df) > 0:
        col1, col2 = st.columns(2)

        with col1:
            st.subheader("Score Distribution")
            fig = px.histogram(
                ingredients_df,
                x='overall_score',
                nbins=20,
                color_discrete_sequence=['#2E7D32']
            )
            fig.update_layout(
                xaxis_title="Overall Score",
                yaxis_title="Count",
                showlegend=False
            )
            st.plotly_chart(fig, use_container_width=True)

        with col2:
            st.subheader("Top 10 Healthiest Ingredients")
            top_10 = ingredients_df.nlargest(10, 'overall_score')
            fig = px.bar(
                top_10,
                x='overall_score',
                y='ingredient_name',
                orientation='h',
                color='overall_score',
                color_continuous_scale='Greens'
            )
            fig.update_layout(
                yaxis={'categoryorder': 'total ascending'},
                xaxis_title="Score",
                yaxis_title="",
                showlegend=False
            )
            st.plotly_chart(fig, use_container_width=True)
    else:
        st.info("No ingredient data found. Search for ingredients in the main app to populate the database.")

    # Recent activity
    st.subheader("Recent User Logs")
    if len(logs_df) > 0:
        st.dataframe(
            logs_df.head(10)[['date', 'email', 'ingredients', 'symptom_energy', 'symptom_bloating']],
            use_container_width=True
        )
    else:
        st.info("No user logs yet.")


def show_ingredients():
    """Ingredient analysis page."""
    st.markdown('<p class="main-header">Ingredient Analysis</p>', unsafe_allow_html=True)
    st.markdown('<p class="sub-header">Explore and analyze ingredient health scores</p>', unsafe_allow_html=True)

    ingredients_df = load_ingredients_data()

    if len(ingredients_df) == 0:
        st.warning("No ingredients in database. Use the main Aurea app to search for ingredients.")

        # Add sample data button
        if st.button("Load Sample Ingredients for Demo"):
            load_sample_ingredients()
            st.rerun()
        return

    # Filters
    col1, col2, col3 = st.columns(3)

    with col1:
        score_range = st.slider(
            "Overall Score Range",
            0, 100, (0, 100)
        )

    with col2:
        confidence_filter = st.multiselect(
            "Evidence Confidence",
            options=['high', 'medium', 'low'],
            default=['high', 'medium', 'low']
        )

    with col3:
        search = st.text_input("Search Ingredient", "")

    # Apply filters
    filtered_df = ingredients_df[
        (ingredients_df['overall_score'] >= score_range[0]) &
        (ingredients_df['overall_score'] <= score_range[1]) &
        (ingredients_df['evidence_confidence'].isin(confidence_filter))
    ]

    if search:
        filtered_df = filtered_df[
            filtered_df['ingredient_name'].str.contains(search.lower(), case=False, na=False)
        ]

    st.markdown(f"**Showing {len(filtered_df)} of {len(ingredients_df)} ingredients**")

    # Visualization tabs
    tab1, tab2, tab3 = st.tabs(["Score Comparison", "Heatmap", "Data Table"])

    with tab1:
        if len(filtered_df) > 0:
            # Multi-score comparison chart
            fig = go.Figure()

            metrics = ['blood_sugar_impact', 'inflammation_potential', 'gut_impact', 'overall_score']
            colors = ['#1976D2', '#D32F2F', '#388E3C', '#7B1FA2']

            for metric, color in zip(metrics, colors):
                fig.add_trace(go.Box(
                    y=filtered_df[metric],
                    name=metric.replace('_', ' ').title(),
                    marker_color=color
                ))

            fig.update_layout(
                title="Score Distribution by Metric",
                yaxis_title="Score (0-100)",
                showlegend=True
            )
            st.plotly_chart(fig, use_container_width=True)

    with tab2:
        if len(filtered_df) > 0:
            # Correlation heatmap
            score_cols = ['blood_sugar_impact', 'inflammation_potential', 'gut_impact', 'overall_score']
            corr_matrix = filtered_df[score_cols].corr()

            fig = px.imshow(
                corr_matrix,
                labels=dict(color="Correlation"),
                x=[c.replace('_', ' ').title() for c in score_cols],
                y=[c.replace('_', ' ').title() for c in score_cols],
                color_continuous_scale='RdYlGn'
            )
            fig.update_layout(title="Score Correlation Matrix")
            st.plotly_chart(fig, use_container_width=True)

    with tab3:
        st.dataframe(
            filtered_df[['ingredient_name', 'overall_score', 'blood_sugar_impact',
                        'inflammation_potential', 'gut_impact', 'evidence_confidence']],
            use_container_width=True
        )

        # Export button
        csv = filtered_df.to_csv(index=False)
        st.download_button(
            label="Download CSV",
            data=csv,
            file_name="ingredients_export.csv",
            mime="text/csv"
        )


def show_analytics():
    """Advanced analytics page."""
    st.markdown('<p class="main-header">Advanced Analytics</p>', unsafe_allow_html=True)
    st.markdown('<p class="sub-header">Deep dive into ingredient and user data</p>', unsafe_allow_html=True)

    ingredients_df = load_ingredients_data()
    logs_df = load_user_logs()

    # Analytics sections
    analysis_type = st.selectbox(
        "Select Analysis Type",
        ["Ingredient Score Analysis", "User Engagement", "Symptom Patterns"]
    )

    if analysis_type == "Ingredient Score Analysis":
        if len(ingredients_df) > 0:
            col1, col2 = st.columns(2)

            with col1:
                st.subheader("Score Statistics")
                stats = ingredients_df[['blood_sugar_impact', 'inflammation_potential',
                                       'gut_impact', 'overall_score']].describe()
                st.dataframe(stats.round(2))

            with col2:
                st.subheader("Confidence Distribution")
                conf_counts = ingredients_df['evidence_confidence'].value_counts()
                fig = px.pie(
                    values=conf_counts.values,
                    names=conf_counts.index,
                    color_discrete_sequence=['#2E7D32', '#FFA726', '#EF5350']
                )
                st.plotly_chart(fig, use_container_width=True)

            # Scatter plot
            st.subheader("Blood Sugar vs Inflammation")
            fig = px.scatter(
                ingredients_df,
                x='blood_sugar_impact',
                y='inflammation_potential',
                color='overall_score',
                hover_data=['ingredient_name'],
                color_continuous_scale='RdYlGn_r'
            )
            st.plotly_chart(fig, use_container_width=True)
        else:
            st.info("No ingredient data available.")

    elif analysis_type == "User Engagement":
        if len(logs_df) > 0:
            # Logs over time
            logs_df['date'] = pd.to_datetime(logs_df['date'])
            daily_logs = logs_df.groupby('date').size().reset_index(name='count')

            fig = px.line(
                daily_logs,
                x='date',
                y='count',
                title="Daily Log Activity"
            )
            st.plotly_chart(fig, use_container_width=True)
        else:
            st.info("No user log data available.")

    elif analysis_type == "Symptom Patterns":
        if len(logs_df) > 0:
            symptom_cols = ['symptom_energy', 'symptom_bloating', 'symptom_focus',
                           'symptom_mood', 'symptom_sleep']

            # Average symptoms
            avg_symptoms = logs_df[symptom_cols].mean()

            fig = px.bar(
                x=[c.replace('symptom_', '').title() for c in symptom_cols],
                y=avg_symptoms.values,
                title="Average Symptom Scores",
                color=avg_symptoms.values,
                color_continuous_scale='RdYlGn'
            )
            fig.update_layout(xaxis_title="Symptom", yaxis_title="Average Score (0-5)")
            st.plotly_chart(fig, use_container_width=True)
        else:
            st.info("No symptom data available.")


def show_python_console():
    """Interactive Python console for data analysis."""
    st.markdown('<p class="main-header">Python Data Analysis Console</p>', unsafe_allow_html=True)
    st.markdown('<p class="sub-header">Write and execute Python code for custom analysis</p>', unsafe_allow_html=True)

    # Security warning for admin console
    st.warning("This console executes Python code. Use with caution.")

    # Pre-load data info
    st.info("""
    **Available DataFrames:**
    - `ingredients_df` - Ingredient scores data
    - `logs_df` - User log data
    - `users_df` - User data

    **Available Libraries:** pandas (pd), numpy (np), plotly.express (px), sqlite3
    """)

    # Load data for the console
    ingredients_df = load_ingredients_data()
    logs_df = load_user_logs()
    users_df = load_users()

    # Code templates
    template = st.selectbox(
        "Code Templates",
        [
            "-- Select a template --",
            "Basic data exploration",
            "Score statistics",
            "Top/Bottom ingredients",
            "Custom SQL query",
            "Correlation analysis"
        ]
    )

    # Default code based on template
    default_code = ""
    if template == "Basic data exploration":
        default_code = """# Explore the ingredients data
print(f"Total ingredients: {len(ingredients_df)}")
print(f"\\nColumns: {list(ingredients_df.columns)}")
print(f"\\nFirst 5 rows:")
ingredients_df.head()"""
    elif template == "Score statistics":
        default_code = """# Calculate statistics for all score columns
score_cols = ['blood_sugar_impact', 'inflammation_potential', 'gut_impact', 'overall_score']
stats = ingredients_df[score_cols].describe()
print(stats.round(2))"""
    elif template == "Top/Bottom ingredients":
        default_code = """# Find best and worst ingredients
print("Top 5 Healthiest:")
print(ingredients_df.nlargest(5, 'overall_score')[['ingredient_name', 'overall_score']])
print("\\nTop 5 Least Healthy:")
print(ingredients_df.nsmallest(5, 'overall_score')[['ingredient_name', 'overall_score']])"""
    elif template == "Custom SQL query":
        default_code = """# Run a custom SQL query
import sqlite3
db_path = get_db_path()
conn = sqlite3.connect(db_path)

query = '''
SELECT ingredient_name, overall_score
FROM ingredient_scores
WHERE overall_score > 70
ORDER BY overall_score DESC
LIMIT 10
'''

result = pd.read_sql_query(query, conn)
conn.close()
result"""
    elif template == "Correlation analysis":
        default_code = """# Analyze correlations between scores
score_cols = ['blood_sugar_impact', 'inflammation_potential', 'gut_impact', 'overall_score']
correlation_matrix = ingredients_df[score_cols].corr()
print("Correlation Matrix:")
print(correlation_matrix.round(3))"""

    # Code editor
    code = st.text_area(
        "Python Code",
        value=default_code,
        height=200,
        key="python_code"
    )

    col1, col2 = st.columns([1, 5])
    with col1:
        run_button = st.button("Run Code", type="primary")

    if run_button and code:
        st.markdown("---")
        st.subheader("Output")

        try:
            # Create execution environment
            import numpy as np
            exec_globals = {
                'pd': pd,
                'np': np,
                'px': px,
                'sqlite3': sqlite3,
                'st': st,
                'ingredients_df': ingredients_df,
                'logs_df': logs_df,
                'users_df': users_df,
                'get_db_path': get_db_path,
            }

            # Capture output
            import io
            from contextlib import redirect_stdout

            output = io.StringIO()
            with redirect_stdout(output):
                result = exec(code, exec_globals)

            # Display printed output
            printed_output = output.getvalue()
            if printed_output:
                st.text(printed_output)

            # Check if last expression returned something
            if 'result' in exec_globals and exec_globals.get('result') is not None:
                st.write(exec_globals['result'])

        except Exception as e:
            st.error(f"Error: {str(e)}")
            import traceback
            st.code(traceback.format_exc())


def load_sample_ingredients():
    """Load sample ingredients into the database for demo purposes."""
    db_path = get_db_path()

    # Create database directory if needed
    Path(db_path).parent.mkdir(parents=True, exist_ok=True)

    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()

    # Create table if not exists
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS ingredient_scores (
            id TEXT PRIMARY KEY,
            ingredient_name TEXT UNIQUE,
            blood_sugar_impact INTEGER,
            inflammation_potential INTEGER,
            gut_impact INTEGER,
            overall_score INTEGER,
            hormonal_relevance TEXT,
            evidence_confidence TEXT,
            sources TEXT,
            cached_at TIMESTAMP,
            updated_at TIMESTAMP
        )
    """)

    # Sample data
    import uuid
    from datetime import datetime
    import json

    sample_ingredients = [
        ("broccoli", 85, 15, 90, 88, "high"),
        ("spinach", 90, 10, 85, 90, "high"),
        ("salmon", 80, 20, 75, 82, "high"),
        ("sugar", 15, 75, 30, 25, "high"),
        ("olive oil", 85, 15, 80, 85, "high"),
        ("white bread", 30, 55, 40, 35, "medium"),
        ("blueberries", 75, 10, 85, 85, "high"),
        ("processed cheese", 50, 60, 35, 42, "medium"),
        ("quinoa", 70, 20, 80, 75, "medium"),
        ("soda", 10, 80, 20, 18, "high"),
        ("avocado", 80, 15, 85, 85, "high"),
        ("bacon", 45, 70, 30, 38, "medium"),
        ("greek yogurt", 75, 25, 90, 80, "high"),
        ("candy", 10, 85, 15, 15, "high"),
        ("turmeric", 85, 5, 85, 90, "medium"),
    ]

    for name, blood, inflam, gut, overall, confidence in sample_ingredients:
        try:
            cursor.execute("""
                INSERT OR IGNORE INTO ingredient_scores
                (id, ingredient_name, blood_sugar_impact, inflammation_potential,
                 gut_impact, overall_score, hormonal_relevance, evidence_confidence,
                 sources, cached_at, updated_at)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            """, (
                str(uuid.uuid4()),
                name,
                blood,
                inflam,
                gut,
                overall,
                json.dumps({"score": 50, "insulin_impact": "moderate"}),
                confidence,
                json.dumps([{"name": "Sample Data"}]),
                datetime.now().isoformat(),
                datetime.now().isoformat()
            ))
        except Exception:
            pass

    conn.commit()
    conn.close()
    st.success("Sample ingredients loaded!")


if __name__ == "__main__":
    main()
