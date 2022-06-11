from typing import List

from fastapi import APIRouter, Depends, HTTPException

from .models import ActivityModel
from .schemas import CreateActivity, ActivitiesSchema
from ..users.auth import get_user
from ..users.models import User

router = APIRouter()


async def check_activity(id: str, user: User = Depends(get_user)):
    activity = await ActivityModel.get_or_none(id=id)
    if activity is None:
        raise HTTPException(404, 'Activity not found')
    if activity.user_id != user.id:
        raise HTTPException(403, 'User does not have access to this')
    return activity


@router.get('/all', response_model=List[ActivitiesSchema])
async def get_all():
    return await ActivitiesSchema.from_queryset(ActivityModel.all())


@router.post('/', response_model=ActivitiesSchema)
async def create_activity(new_activity: CreateActivity, user: User = Depends(get_user)):
    activity = await ActivityModel.create(**new_activity.dict(), user_id=user.id)
    return await ActivitiesSchema.from_tortoise_orm(activity)


@router.get('/{id}', response_model=ActivitiesSchema)
async def get_my(activity: ActivityModel = Depends(check_activity)):
    return await ActivitiesSchema.from_tortoise_orm(activity)


@router.put('/', response_model=ActivitiesSchema)
async def edit_activity(edited_activity: CreateActivity, activity: ActivityModel = Depends(check_activity)):
    await activity.update_from_dict(edited_activity.dict())
    await activity.save()
    return await ActivitiesSchema.from_tortoise_orm(activity)


@router.delete('/')
async def delete_activity(activity: ActivityModel = Depends(check_activity)):
    await activity.delete()
    return {'ok': True}