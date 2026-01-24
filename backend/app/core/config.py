"""
Application configuration settings.
Loads environment variables and provides type-safe access to configuration.
"""

from pydantic_settings import BaseSettings
from pydantic import field_validator
from typing import List
import os
import secrets
import warnings


class Settings(BaseSettings):
    """Application settings loaded from environment variables."""

    # Application
    APP_NAME: str = "Aurea API"
    DEBUG: bool = True  # Enable debug for detailed error messages
    ENVIRONMENT: str = "development"

    # Database
    # Default to SQLite for local development, use PostgreSQL in production
    DATABASE_URL: str = "sqlite:///./aurea.db"

    # JWT Authentication
    # SECURITY: Must be changed in production!
    JWT_SECRET: str = "dev-only-secret-change-in-production"
    JWT_ALGORITHM: str = "HS256"
    JWT_EXPIRATION_HOURS: int = 24

    # CORS - includes local network IPs for development
    CORS_ORIGINS: List[str] = ["*"]  # Allow all origins for development

    # API Rate Limiting
    RATE_LIMIT_PER_MINUTE: int = 60
    LOGIN_RATE_LIMIT_PER_MINUTE: int = 5  # Stricter for auth endpoints

    @field_validator('JWT_SECRET')
    @classmethod
    def validate_jwt_secret(cls, v, info):
        """Validate JWT secret is secure in production."""
        # Get environment from context or default
        env = os.getenv('ENVIRONMENT', 'development')

        insecure_defaults = [
            "your-super-secret-jwt-key-change-in-production",
            "dev-only-secret-change-in-production",
            "secret",
            "changeme"
        ]

        if env == "production":
            if v in insecure_defaults or len(v) < 32:
                raise ValueError(
                    "JWT_SECRET must be a secure random string of at least 32 characters in production. "
                    f"Generate one with: python -c \"import secrets; print(secrets.token_urlsafe(64))\""
                )
        elif v in insecure_defaults:
            warnings.warn(
                "Using insecure default JWT_SECRET. "
                "Set a secure secret before deploying to production.",
                UserWarning
            )
        return v

    class Config:
        env_file = ".env"
        case_sensitive = True


# Create global settings instance
settings = Settings()
