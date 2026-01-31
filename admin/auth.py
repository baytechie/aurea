"""
Authentication utilities for Aurea Admin Dashboard.

Provides JWT-based authentication that validates against the same secret
used by the main backend API. Users authenticate with their existing
credentials from the main application.

Security Features:
- JWT token validation with expiration checking
- bcrypt password verification
- Session state management for Streamlit's execution model
- Logout functionality with session cleanup
"""

import os
import jwt
import bcrypt
from datetime import datetime, timezone, timedelta
from typing import Optional, Tuple
from dataclasses import dataclass
from sqlalchemy import create_engine, text
from sqlalchemy.orm import sessionmaker


# ============================================================
# Configuration
# ============================================================

# JWT settings - must match the backend
JWT_SECRET = os.environ.get("JWT_SECRET", "dev-only-secret-change-in-production")
JWT_ALGORITHM = "HS256"
JWT_EXPIRATION_HOURS = 24

# Database configuration
DATABASE_URL = os.environ.get("DATABASE_URL", "")


# ============================================================
# Data Classes
# ============================================================

@dataclass
class AuthenticatedUser:
    """Represents an authenticated user session."""
    id: str
    email: str
    token: str
    name: Optional[str] = None
    is_admin: bool = False  # For future admin role support


@dataclass
class AuthResult:
    """Result of an authentication attempt."""
    success: bool
    user: Optional[AuthenticatedUser] = None
    error: Optional[str] = None


# ============================================================
# Database Connection
# ============================================================

def get_db_engine():
    """
    Get SQLAlchemy database engine.
    Supports PostgreSQL (production) and SQLite (local development).
    """
    if DATABASE_URL:
        # Production: Use PostgreSQL via DATABASE_URL
        # Render uses postgres:// but SQLAlchemy needs postgresql://
        db_url = DATABASE_URL.replace("postgres://", "postgresql://", 1)
        return create_engine(db_url)
    else:
        # Local development: Use SQLite
        from pathlib import Path
        possible_paths = [
            Path(__file__).parent.parent / "backend" / "aurea.db",
            Path("/tmp/aurea.db"),
            Path(__file__).parent.parent / "backend" / "app" / "aurea.db",
        ]
        for path in possible_paths:
            if path.exists():
                return create_engine(f"sqlite:///{path}")
        # Return first path as default
        return create_engine(f"sqlite:///{possible_paths[0]}")


# ============================================================
# Password Verification
# ============================================================

def verify_password(plain_password: str, hashed_password: str) -> bool:
    """
    Verify a password against its bcrypt hash.

    Args:
        plain_password: The plain text password to verify
        hashed_password: The bcrypt hash to verify against

    Returns:
        True if password matches, False otherwise
    """
    try:
        password_bytes = plain_password.encode('utf-8')
        hashed_bytes = hashed_password.encode('utf-8')
        return bcrypt.checkpw(password_bytes, hashed_bytes)
    except Exception:
        return False


# ============================================================
# JWT Token Management
# ============================================================

def create_access_token(user_id: str, email: str, expires_delta: Optional[timedelta] = None) -> str:
    """
    Create a JWT access token.

    Args:
        user_id: The user's unique identifier
        email: The user's email address
        expires_delta: Optional custom expiration time

    Returns:
        Encoded JWT token string
    """
    if expires_delta:
        expire = datetime.now(timezone.utc) + expires_delta
    else:
        expire = datetime.now(timezone.utc) + timedelta(hours=JWT_EXPIRATION_HOURS)

    to_encode = {
        "sub": user_id,
        "email": email,
        "exp": expire,
        "iat": datetime.now(timezone.utc)
    }

    encoded_jwt = jwt.encode(to_encode, JWT_SECRET, algorithm=JWT_ALGORITHM)
    return encoded_jwt


def decode_access_token(token: str) -> Tuple[bool, Optional[dict], Optional[str]]:
    """
    Decode and validate a JWT token.

    Args:
        token: JWT token string

    Returns:
        Tuple of (success, payload, error_message)
    """
    try:
        payload = jwt.decode(
            token,
            JWT_SECRET,
            algorithms=[JWT_ALGORITHM]
        )
        return True, payload, None
    except jwt.ExpiredSignatureError:
        return False, None, "Token has expired. Please log in again."
    except jwt.InvalidTokenError as e:
        return False, None, f"Invalid token: {str(e)}"


def validate_token(token: str) -> Tuple[bool, Optional[AuthenticatedUser], Optional[str]]:
    """
    Validate a JWT token and return the authenticated user.

    This function:
    1. Decodes the token and checks signature/expiration
    2. Verifies the user still exists in the database
    3. Returns an AuthenticatedUser object if valid

    Args:
        token: JWT token string

    Returns:
        Tuple of (is_valid, user, error_message)
    """
    # Decode token
    success, payload, error = decode_access_token(token)
    if not success:
        return False, None, error

    user_id = payload.get("sub")
    email = payload.get("email")

    if not user_id:
        return False, None, "Invalid token payload: missing user ID"

    # Verify user still exists in database
    try:
        engine = get_db_engine()
        with engine.connect() as conn:
            result = conn.execute(
                text("SELECT id, email, name FROM users WHERE id = :user_id"),
                {"user_id": user_id}
            )
            row = result.fetchone()

            if not row:
                return False, None, "User not found. Account may have been deleted."

            user = AuthenticatedUser(
                id=str(row[0]),
                email=row[1],
                token=token,
                name=row[2] if len(row) > 2 else None
            )
            return True, user, None

    except Exception as e:
        return False, None, f"Database error: {str(e)}"


# ============================================================
# Authentication Functions
# ============================================================

def authenticate_user(email: str, password: str) -> AuthResult:
    """
    Authenticate a user with email and password.

    This function:
    1. Looks up the user by email
    2. Verifies the password against the stored hash
    3. Creates a new JWT token
    4. Returns an AuthResult with the authenticated user

    Args:
        email: User's email address
        password: User's plain text password

    Returns:
        AuthResult with success status and user or error message
    """
    try:
        engine = get_db_engine()
        with engine.connect() as conn:
            # Find user by email
            result = conn.execute(
                text("SELECT id, email, password_hash, name FROM users WHERE email = :email"),
                {"email": email.lower().strip()}
            )
            row = result.fetchone()

            if not row:
                return AuthResult(
                    success=False,
                    error="Invalid email or password"
                )

            user_id = str(row[0])
            user_email = row[1]
            password_hash = row[2]
            user_name = row[3] if len(row) > 3 else None

            # Verify password
            if not verify_password(password, password_hash):
                return AuthResult(
                    success=False,
                    error="Invalid email or password"
                )

            # Create JWT token
            token = create_access_token(user_id, user_email)

            # Return authenticated user
            user = AuthenticatedUser(
                id=user_id,
                email=user_email,
                token=token,
                name=user_name
            )

            return AuthResult(success=True, user=user)

    except Exception as e:
        return AuthResult(
            success=False,
            error=f"Authentication error: {str(e)}"
        )


# ============================================================
# Streamlit Session Management
# ============================================================

def init_session_state():
    """
    Initialize Streamlit session state for authentication.

    This should be called at the start of the app to ensure
    all required session state variables exist.
    """
    import streamlit as st

    if "authenticated" not in st.session_state:
        st.session_state.authenticated = False
    if "user" not in st.session_state:
        st.session_state.user = None
    if "auth_token" not in st.session_state:
        st.session_state.auth_token = None
    if "login_error" not in st.session_state:
        st.session_state.login_error = None


def login(email: str, password: str) -> bool:
    """
    Attempt to log in a user and update session state.

    Args:
        email: User's email address
        password: User's password

    Returns:
        True if login successful, False otherwise
    """
    import streamlit as st

    result = authenticate_user(email, password)

    if result.success and result.user:
        st.session_state.authenticated = True
        st.session_state.user = result.user
        st.session_state.auth_token = result.user.token
        st.session_state.login_error = None
        return True
    else:
        st.session_state.authenticated = False
        st.session_state.user = None
        st.session_state.auth_token = None
        st.session_state.login_error = result.error
        return False


def logout():
    """
    Log out the current user and clear session state.
    """
    import streamlit as st

    st.session_state.authenticated = False
    st.session_state.user = None
    st.session_state.auth_token = None
    st.session_state.login_error = None


def is_authenticated() -> bool:
    """
    Check if the current session is authenticated.

    Also validates the token is still valid (not expired, user still exists).

    Returns:
        True if authenticated with valid token, False otherwise
    """
    import streamlit as st

    if not st.session_state.get("authenticated"):
        return False

    token = st.session_state.get("auth_token")
    if not token:
        return False

    # Validate token is still valid
    is_valid, user, error = validate_token(token)

    if not is_valid:
        # Token is no longer valid, clear session
        st.session_state.authenticated = False
        st.session_state.user = None
        st.session_state.auth_token = None
        st.session_state.login_error = error
        return False

    # Update user info in case it changed
    if user:
        st.session_state.user = user

    return True


def get_current_user() -> Optional[AuthenticatedUser]:
    """
    Get the currently authenticated user.

    Returns:
        AuthenticatedUser if authenticated, None otherwise
    """
    import streamlit as st

    if is_authenticated():
        return st.session_state.get("user")
    return None


def require_auth():
    """
    Decorator-like function that ensures user is authenticated.

    Call this at the start of protected pages. If not authenticated,
    it will stop execution and the login form will be shown.

    Usage:
        def protected_page():
            require_auth()
            # ... rest of page content
    """
    import streamlit as st

    if not is_authenticated():
        st.stop()


# ============================================================
# Login UI Component
# ============================================================

def show_login_form():
    """
    Display the login form UI.

    This creates a centered login form with email/password fields
    and handles form submission.
    """
    import streamlit as st

    # Center the login form
    col1, col2, col3 = st.columns([1, 2, 1])

    with col2:
        st.markdown("""
        <div style="text-align: center; padding: 2rem 0;">
            <h1 style="color: #2E7D32;">Aurea Admin</h1>
            <p style="color: #666;">Sign in with your Aurea account</p>
        </div>
        """, unsafe_allow_html=True)

        # Login form
        with st.form("login_form"):
            email = st.text_input(
                "Email",
                placeholder="Enter your email",
                key="login_email"
            )
            password = st.text_input(
                "Password",
                type="password",
                placeholder="Enter your password",
                key="login_password"
            )

            submitted = st.form_submit_button(
                "Sign In",
                use_container_width=True,
                type="primary"
            )

            if submitted:
                if not email or not password:
                    st.error("Please enter both email and password")
                else:
                    with st.spinner("Signing in..."):
                        if login(email, password):
                            st.rerun()
                        else:
                            error = st.session_state.get("login_error", "Login failed")
                            st.error(error)

        # Show any existing error
        if st.session_state.get("login_error") and not submitted:
            st.error(st.session_state.login_error)

        st.markdown("""
        <div style="text-align: center; padding-top: 1rem; color: #999; font-size: 0.9rem;">
            Use your existing Aurea account credentials
        </div>
        """, unsafe_allow_html=True)


def show_logout_button():
    """
    Display a logout button in the sidebar.
    """
    import streamlit as st

    user = get_current_user()
    if user:
        st.sidebar.markdown("---")
        st.sidebar.markdown(f"**Logged in as:** {user.email}")
        if user.name:
            st.sidebar.caption(user.name)

        if st.sidebar.button("Logout", use_container_width=True):
            logout()
            st.rerun()
