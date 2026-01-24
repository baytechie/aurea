"""
Aurea API - Main FastAPI Application

Personal Ingredient Predictor API
"""

from fastapi import FastAPI, Request
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse
from starlette.middleware.base import BaseHTTPMiddleware
from contextlib import asynccontextmanager
import logging

from app.core.config import settings
from app.core.database import init_db
from app.api.routes import router

logger = logging.getLogger(__name__)


class SecurityHeadersMiddleware(BaseHTTPMiddleware):
    """Add security headers to all responses."""

    async def dispatch(self, request: Request, call_next):
        response = await call_next(request)
        # Prevent clickjacking
        response.headers["X-Frame-Options"] = "DENY"
        # Prevent MIME type sniffing
        response.headers["X-Content-Type-Options"] = "nosniff"
        # XSS protection
        response.headers["X-XSS-Protection"] = "1; mode=block"
        # Referrer policy
        response.headers["Referrer-Policy"] = "strict-origin-when-cross-origin"
        # Permissions policy
        response.headers["Permissions-Policy"] = "geolocation=(), microphone=(), camera=()"
        return response


@asynccontextmanager
async def lifespan(app: FastAPI):
    """
    Application lifespan handler.
    Runs on startup and shutdown.
    """
    # Startup: Initialize database tables
    print("Initializing database...")
    init_db()
    print("Database initialized!")

    yield

    # Shutdown: Cleanup if needed
    print("Shutting down...")


# Create FastAPI application
app = FastAPI(
    title=settings.APP_NAME,
    description="""
    Aurea - Personal Ingredient Predictor API

    Track what you eat, understand how ingredients affect your body,
    and get personalized insights to feel your best.

    ## Features
    - **Ingredient Scoring**: Get health impact scores for any ingredient
    - **Daily Logging**: Track ingredients and symptoms
    - **ML Predictions**: Personalized symptom predictions
    - **Insights**: Discover your trigger foods

    ## Authentication
    All endpoints except /health and /ingredient/{name} require JWT authentication.
    Use /auth/signup or /auth/login to get a token.
    """,
    version="1.0.0",
    lifespan=lifespan
)

# Add security headers middleware
app.add_middleware(SecurityHeadersMiddleware)

# Configure CORS
# When using wildcard "*", credentials must be False
allow_all_origins = "*" in settings.CORS_ORIGINS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"] if allow_all_origins else settings.CORS_ORIGINS,
    allow_credentials=not allow_all_origins,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Global exception handler for production
@app.exception_handler(Exception)
async def global_exception_handler(request: Request, exc: Exception):
    """Catch unhandled exceptions and return safe error response."""
    logger.error(f"Unhandled exception: {exc}", exc_info=True)
    if settings.DEBUG:
        # In debug mode, return detailed error
        return JSONResponse(
            status_code=500,
            content={"detail": str(exc)}
        )
    # In production, return generic error
    return JSONResponse(
        status_code=500,
        content={"detail": "An internal error occurred. Please try again later."}
    )

# Include API routes
app.include_router(router)


# Root endpoint
@app.get("/", tags=["Root"])
async def root():
    """Root endpoint - API information."""
    return {
        "name": settings.APP_NAME,
        "version": "1.0.0",
        "docs": "/docs",
        "health": "/health"
    }
