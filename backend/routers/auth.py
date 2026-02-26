"""Simple auth endpoints using DynamoDB + JWT."""

from fastapi import APIRouter, HTTPException, Depends, Header
from pydantic import BaseModel, EmailStr
from typing import Optional

from backend.services import dynamo_repository as ddb
from backend.services.auth_service import hash_password, verify_password, create_jwt, decode_jwt

router = APIRouter(tags=["auth"])


class RegisterRequest(BaseModel):
    email: EmailStr
    password: str
    team_name: Optional[str] = ""


class LoginRequest(BaseModel):
    email: EmailStr
    password: str


@router.post("/auth/register")
async def register(payload: RegisterRequest):
    if ddb.get_user(payload.email):
        raise HTTPException(status_code=400, detail="User already exists")
    pw_hash = hash_password(payload.password)
    ddb.save_user(payload.email, pw_hash, payload.team_name or "")
    token = create_jwt(payload.email, payload.email)
    return {"token": token, "email": payload.email, "team_name": payload.team_name or ""}


@router.post("/auth/login")
async def login(payload: LoginRequest):
    user = ddb.get_user(payload.email)
    if not user or not verify_password(payload.password, user.get("password_hash", "")):
        raise HTTPException(status_code=401, detail="Invalid credentials")
    token = create_jwt(payload.email, payload.email)
    return {"token": token, "email": payload.email, "team_name": user.get("team_name", "")}


def current_user(authorization: Optional[str] = Header(None)) -> Optional[dict]:
    if not authorization or not authorization.lower().startswith("bearer "):
        return None
    token = authorization.split(" ", 1)[1]
    data = decode_jwt(token)
    return data
