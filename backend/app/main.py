"""
Aurea API - Main FastAPI Application

Personal Ingredient Predictor API
"""

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from contextlib import asynccontextmanager

from app.core.config import settings
from app.core.database import init_db
from app.api.routes import router


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

# Configure CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.CORS_ORIGINS,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
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
