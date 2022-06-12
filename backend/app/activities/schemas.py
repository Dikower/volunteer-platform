from typing import Any, Optional, Union
from enum import Enum
from pydantic import BaseModel
from tortoise.contrib.pydantic import pydantic_model_creator

from .models import ActivityModel

ActivitiesSchema = pydantic_model_creator(
    ActivityModel, name='ActivitiesSchema', exclude=(), include=()
)


class ParticipationType(Enum):
    online = "online"
    offline = "offline"


CreateActivity = pydantic_model_creator(
    ActivityModel, name='CreateActivitySchema', exclude=('id', 'creation_date')
)

# class CreateActivity(BaseModel):
#     name: Optional[str]
#     description: Optional[str]
#     date: Optional[str]
#     location: Optional[str]
#     type: Optional[str]
#     tasks: Optional[str]
#     participants: Optional[str]
#     participation_type: Union[ParticipationType]
#     image: Optional[str]
#     isHot: Optional[bool]
#     lowerBorderOfMembersAmount: Optional[int]
