"""
API Endpoint Tests

Run with: pytest tests/test_endpoints.py -v
"""

import pytest
from fastapi.testclient import TestClient
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.pool import StaticPool

from app.main import app
from app.core.database import Base, get_db


# Create test database (in-memory SQLite)
SQLALCHEMY_DATABASE_URL = "sqlite:///:memory:"

engine = create_engine(
    SQLALCHEMY_DATABASE_URL,
    connect_args={"check_same_thread": False},
    poolclass=StaticPool,
)
TestingSessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)


def override_get_db():
    """Override database dependency for testing."""
    try:
        db = TestingSessionLocal()
        yield db
    finally:
        db.close()


# Override the dependency
app.dependency_overrides[get_db] = override_get_db

# Create test client
client = TestClient(app)


@pytest.fixture(autouse=True)
def setup_database():
    """Create tables before each test, drop after."""
    Base.metadata.create_all(bind=engine)
    yield
    Base.metadata.drop_all(bind=engine)


class TestHealthEndpoint:
    """Tests for /health endpoint."""

    def test_health_check(self):
        """Test that health endpoint returns OK."""
        response = client.get("/health")
        assert response.status_code == 200
        data = response.json()
        assert data["status"] == "ok"
        assert "version" in data


class TestRootEndpoint:
    """Tests for root endpoint."""

    def test_root(self):
        """Test root endpoint returns API info."""
        response = client.get("/")
        assert response.status_code == 200
        data = response.json()
        assert "name" in data
        assert "docs" in data


class TestAuthEndpoints:
    """Tests for authentication endpoints."""

    def test_signup_success(self):
        """Test successful user registration."""
        response = client.post(
            "/auth/signup",
            json={"email": "test@example.com", "password": "password123"}
        )
        assert response.status_code == 200
        data = response.json()
        assert "token" in data
        assert data["email"] == "test@example.com"

    def test_signup_duplicate_email(self):
        """Test signup with existing email fails."""
        # First signup
        client.post(
            "/auth/signup",
            json={"email": "test@example.com", "password": "password123"}
        )
        # Second signup with same email
        response = client.post(
            "/auth/signup",
            json={"email": "test@example.com", "password": "password456"}
        )
        assert response.status_code == 400
        assert "already registered" in response.json()["detail"]

    def test_login_success(self):
        """Test successful login."""
        # First create user
        client.post(
            "/auth/signup",
            json={"email": "test@example.com", "password": "password123"}
        )
        # Then login
        response = client.post(
            "/auth/login",
            json={"email": "test@example.com", "password": "password123"}
        )
        assert response.status_code == 200
        data = response.json()
        assert "token" in data

    def test_login_wrong_password(self):
        """Test login with wrong password fails."""
        # First create user
        client.post(
            "/auth/signup",
            json={"email": "test@example.com", "password": "password123"}
        )
        # Try to login with wrong password
        response = client.post(
            "/auth/login",
            json={"email": "test@example.com", "password": "wrongpassword"}
        )
        assert response.status_code == 401

    def test_login_nonexistent_user(self):
        """Test login with non-existent user fails."""
        response = client.post(
            "/auth/login",
            json={"email": "nonexistent@example.com", "password": "password123"}
        )
        assert response.status_code == 401


class TestIngredientEndpoints:
    """Tests for ingredient endpoints."""

    def test_get_ingredient_score(self):
        """Test getting ingredient score (returns mock data)."""
        response = client.get("/ingredient/sugar")
        assert response.status_code == 200
        data = response.json()
        assert data["name"] == "sugar"
        assert "blood_sugar_impact" in data
        assert "inflammation_potential" in data


class TestProtectedEndpoints:
    """Tests for protected endpoints (require auth)."""

    def get_auth_headers(self):
        """Helper to get auth headers."""
        # Create user and login
        client.post(
            "/auth/signup",
            json={"email": "test@example.com", "password": "password123"}
        )
        response = client.post(
            "/auth/login",
            json={"email": "test@example.com", "password": "password123"}
        )
        token = response.json()["token"]
        return {"Authorization": f"Bearer {token}"}

    def test_create_log_requires_auth(self):
        """Test that creating a log requires authentication."""
        response = client.post(
            "/logs",
            json={
                "ingredients": ["sugar"],
                "symptoms": {
                    "energy": 3,
                    "bloating": 2,
                    "focus": 3,
                    "mood": 3,
                    "sleep": 3
                }
            }
        )
        assert response.status_code == 403

    def test_create_log_with_auth(self):
        """Test creating a log with authentication."""
        headers = self.get_auth_headers()
        response = client.post(
            "/logs",
            json={
                "ingredients": ["sugar", "wheat"],
                "symptoms": {
                    "energy": 3,
                    "bloating": 2,
                    "focus": 3,
                    "mood": 4,
                    "sleep": 3
                }
            },
            headers=headers
        )
        assert response.status_code == 200
        data = response.json()
        assert data["ingredients"] == ["sugar", "wheat"]

    def test_get_logs(self):
        """Test getting user's logs."""
        headers = self.get_auth_headers()

        # Create a log first
        client.post(
            "/logs",
            json={
                "ingredients": ["test"],
                "symptoms": {
                    "energy": 3,
                    "bloating": 2,
                    "focus": 3,
                    "mood": 3,
                    "sleep": 3
                }
            },
            headers=headers
        )

        # Get logs
        response = client.get("/logs", headers=headers)
        assert response.status_code == 200
        data = response.json()
        assert isinstance(data, list)
        assert len(data) >= 1

    def test_get_insights(self):
        """Test getting user insights."""
        headers = self.get_auth_headers()
        response = client.get("/insights", headers=headers)
        assert response.status_code == 200
        data = response.json()
        assert "top_triggers" in data
        assert "recommendations" in data

    def test_create_prediction(self):
        """Test creating a prediction."""
        headers = self.get_auth_headers()
        response = client.post(
            "/predictions",
            json={
                "ingredients": ["sugar", "dairy"],
                "cycle_phase": "luteal"
            },
            headers=headers
        )
        assert response.status_code == 200
        data = response.json()
        assert "predicted_bloating_probability" in data
        assert "interpretation" in data
