"""Lightweight email/password auth backed by DynamoDB and JWT."""

import os
import time
import bcrypt
import jwt
from typing import Optional, Dict, Any
from backend.config import API_SECRET_KEY
from backend.services.dynamo_repository import (
    get_user,
    save_user,
)


def hash_password(password: str) -> str:
    return bcrypt.hashpw(password.encode("utf-8"), bcrypt.gensalt()).decode("utf-8")


def verify_password(password: str, hashed: str) -> bool:
    try:
        return bcrypt.checkpw(password.encode("utf-8"), hashed.encode("utf-8"))
    except Exception:
        return False


def create_jwt(sub: str, email: str) -> str:
    now = int(time.time())
    payload = {
        "sub": sub,
        "email": email,
        "iat": now,
        "exp": now + 60 * 60 * 24 * 7,  # 7 days
    }
    return jwt.encode(payload, API_SECRET_KEY, algorithm="HS256")


def decode_jwt(token: str) -> Optional[Dict[str, Any]]:
    try:
        return jwt.decode(token, API_SECRET_KEY, algorithms=["HS256"])
    except Exception:
        return None
