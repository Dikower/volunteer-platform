from typing import List

from fastapi import APIRouter, Depends, HTTPException

from .models import AchievementModel
from .schemas import CreateAchievement, AchievementsSchema
from ..users.auth import get_user
from ..users.models import User

router = APIRouter()


async def check_achievement(id: str, user: User = Depends(get_user)):
    achievement = await AchievementModel.get_or_none(id=id)
    if achievement is None:
        raise HTTPException(404, 'Achievement not found')
    if achievement.user_id != user.id:
        raise HTTPException(403, 'User does not have access to this')
    return achievement


@router.get('/all', response_model=List[AchievementsSchema])
async def get_all():
    return await AchievementsSchema.from_queryset(AchievementModel.all())


@router.post('/', response_model=AchievementsSchema)
async def create_achievement(new_achievement: CreateAchievement, user: User = Depends(get_user)):
    achievement = await AchievementModel.create(**new_achievement.dict(), user_id=user.id)
    return await AchievementsSchema.from_tortoise_orm(achievement)


@router.get('/{id}', response_model=AchievementsSchema)
async def get_my(achievement: AchievementModel = Depends(check_achievement)):
    return await AchievementsSchema.from_tortoise_orm(achievement)


@router.put('/', response_model=AchievementsSchema)
async def edit_achievement(edited_achievement: CreateAchievement, achievement: AchievementModel = Depends(check_achievement)):
    await achievement.update_from_dict(edited_achievement.dict())
    await achievement.save()
    return await AchievementsSchema.from_tortoise_orm(achievement)


@router.delete('/')
async def delete_achievement(achievement: AchievementModel = Depends(check_achievement)):
    await achievement.delete()
    return {'ok': True}