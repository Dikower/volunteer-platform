from typing import Any, Optional

from pydantic import BaseModel
from tortoise.contrib.pydantic import pydantic_model_creator

from .models import ActivityModel

ActivitiesSchema = pydantic_model_creator(
    ActivityModel, name='ActivitiesSchema', exclude=(), include=()
)


class CreateActivity(BaseModel):
    name: str
    desc: str
    pic: str