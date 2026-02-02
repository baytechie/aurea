"""
Apple Sign-In token verification.

This module handles validation of identity tokens from Apple Sign-In.
It fetches Apple's public keys and validates the JWT token.

Reference: https://developer.apple.com/documentation/sign_in_with_apple/sign_in_with_apple_rest_api/verifying_a_user
"""

import logging
from typing import Optional
from dataclasses import dataclass

import jwt
from jwt import PyJWKClient, PyJWKClientError
from fastapi import HTTPException, status

from app.core.config import settings

logger = logging.getLogger(__name__)

# Apple's JWKS (JSON Web Key Set) endpoint
APPLE_JWKS_URL = "https://appleid.apple.com/auth/keys"

# Apple's issuer for identity tokens
APPLE_ISSUER = "https://appleid.apple.com"

# Cache the JWKS client for efficiency
_jwks_client: Optional[PyJWKClient] = None


def get_jwks_client() -> PyJWKClient:
    """
    Get or create a cached PyJWKClient for Apple's public keys.

    The client caches the keys and handles key rotation automatically.
    """
    global _jwks_client
    if _jwks_client is None:
        _jwks_client = PyJWKClient(
            APPLE_JWKS_URL,
            cache_keys=True,
            lifespan=3600  # Cache keys for 1 hour
        )
    return _jwks_client


@dataclass
class AppleTokenPayload:
    """Decoded and validated Apple identity token payload."""

    sub: str  # Apple user ID (unique, stable identifier)
    email: Optional[str] = None
    email_verified: bool = False
    is_private_email: bool = False
    real_user_status: int = 0  # 0=unsupported, 1=unknown, 2=likely_real
    auth_time: Optional[int] = None
    nonce_supported: bool = True


def verify_apple_token(identity_token: str) -> AppleTokenPayload:
    """
    Verify an Apple identity token and return the decoded payload.

    This function:
    1. Fetches Apple's public keys from their JWKS endpoint
    2. Validates the token signature using the appropriate public key
    3. Verifies the token claims (issuer, audience, expiration)
    4. Returns the decoded payload if valid

    Args:
        identity_token: The JWT identity token from Apple Sign-In

    Returns:
        AppleTokenPayload containing the verified user information

    Raises:
        HTTPException: If token validation fails
    """
    try:
        # Get the signing key from Apple's JWKS
        jwks_client = get_jwks_client()
        signing_key = jwks_client.get_signing_key_from_jwt(identity_token)

        # Decode and validate the token
        payload = jwt.decode(
            identity_token,
            signing_key.key,
            algorithms=["RS256"],
            audience=settings.APPLE_CLIENT_ID,
            issuer=APPLE_ISSUER,
            options={
                "verify_signature": True,
                "verify_exp": True,
                "verify_iat": True,
                "verify_aud": True,
                "verify_iss": True,
                "require": ["sub", "iss", "aud", "exp", "iat"]
            }
        )

        # Extract user information from the payload
        return AppleTokenPayload(
            sub=payload["sub"],
            email=payload.get("email"),
            email_verified=payload.get("email_verified", "false") == "true" or payload.get("email_verified") is True,
            is_private_email=payload.get("is_private_email", "false") == "true" or payload.get("is_private_email") is True,
            real_user_status=payload.get("real_user_status", 0),
            auth_time=payload.get("auth_time"),
            nonce_supported=payload.get("nonce_supported", True)
        )

    except PyJWKClientError as e:
        logger.error(f"Failed to fetch Apple signing keys: {e}")
        raise HTTPException(
            status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
            detail="Unable to verify Apple credentials. Please try again."
        )

    except jwt.ExpiredSignatureError:
        logger.warning("Apple identity token has expired")
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Apple sign-in session has expired. Please try again."
        )

    except jwt.InvalidAudienceError:
        logger.warning(f"Apple token has invalid audience")
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid Apple credentials"
        )

    except jwt.InvalidIssuerError:
        logger.warning("Apple token has invalid issuer")
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid Apple credentials"
        )

    except jwt.InvalidTokenError as e:
        logger.warning(f"Invalid Apple identity token: {e}")
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid Apple credentials"
        )

    except Exception as e:
        logger.error(f"Unexpected error verifying Apple token: {e}")
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="An error occurred during sign-in"
        )
