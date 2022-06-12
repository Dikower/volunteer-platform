from typing import List

from fastapi import APIRouter, Depends, HTTPException

from .models import CompanyModel, InfoModel, ParticipationModel
from .schemas import CreateCompany, CompaniesSchema, CreateAll
from ..users.auth import get_user
from ..users.models import User

router = APIRouter()


async def check_company(id: str, user: User = Depends(get_user)):
    company = await CompanyModel.get_or_none(id=id)
    if company is None:
        raise HTTPException(404, 'Company not found')
    if company.user_id != user.id:
        raise HTTPException(403, 'User does not have access to this')
    return company


@router.get('/all', response_model=List[CompaniesSchema])
async def get_all():
    return await CompaniesSchema.from_queryset(CompanyModel.all())


@router.post('/', response_model=CompaniesSchema)
async def create_company(new_company: CreateAll, user: User = Depends(get_user)):
    company = await CompanyModel.create(
        **new_company.company.dict(),
        user_id=user.id
    )
    print(new_company.dict())
    print(company)
    participation = await ParticipationModel.create(**new_company.participation.dict(), company=company)
    info = await InfoModel.create(**new_company.info.dict(), company=company)
    return await CompaniesSchema.from_tortoise_orm(company)


@router.get('/{id}', response_model=CompaniesSchema)
async def get_my(company: CompanyModel = Depends(check_company)):
    return await CompaniesSchema.from_tortoise_orm(company)


@router.put('/', response_model=CompaniesSchema)
async def edit_company(edited_company: CreateAll, company: CompanyModel = Depends(check_company)):
    await company.update_from_dict(edited_company.dict())
    await company.save()
    return await CompaniesSchema.from_tortoise_orm(company)


@router.delete('/')
async def delete_company(company: CompanyModel = Depends(check_company)):
    await company.delete()
    return {'ok': True}