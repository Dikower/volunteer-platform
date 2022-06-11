from typing import Any, Optional

from pydantic import BaseModel
from tortoise.contrib.pydantic import pydantic_model_creator

from .models import AchievementModel

AchievementsSchema = pydantic_model_creator(
    AchievementModel, name='AchievementsSchema', exclude=(), include=()
)


class CreateAchievement(BaseModel):
    name: str
    desc: str
    pic: str