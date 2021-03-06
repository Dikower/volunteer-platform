from typing import Any, Optional
from enum import Enum

from pydantic import BaseModel
from tortoise import Tortoise
from tortoise.contrib.pydantic import pydantic_model_creator

from .models import User

Tortoise.init_models(["app.users.models"], "users")

PublicUser = pydantic_model_creator(
    User, name='PublicUser', exclude=(), include=()
)

PrivateUser = pydantic_model_creator(
    User, name="PrivateUser"
)
EditUser = pydantic_model_creator(
    User, name="EditUser", include=("fio", "avatar")
)


class ProfileType(Enum):
    person = "person"
    company = "company"


class Token(BaseModel):
    access_token: str
    token_type: str


class UserData(BaseModel):
    username: str = 'd@d'
    password: str = 'd'
    profile_type: ProfileType


class PublicHash(BaseModel):
    hash: str


class Success(BaseModel):
    ok: bool
    payload: Optional[Any] = None
