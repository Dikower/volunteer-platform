from typing import Any, Optional

from pydantic import BaseModel
from tortoise.contrib.pydantic import pydantic_model_creator
from tortoise import Tortoise
from .models import CompanyModel, InfoModel, ParticipationModel

Tortoise.init_models(['app.companies.models'], 'companies')

CompaniesSchema = pydantic_model_creator(
    CompanyModel, name='CompaniesSchema', exclude=(), include=()
)

CreateCompany = pydantic_model_creator(
    CompanyModel, name='CreateCompanySchema', exclude=('id',), include=()
)

CreateInfo = pydantic_model_creator(
    InfoModel, name='CreateInfoSchema', exclude=('id', 'reg_date')
)

CreateParticipation = pydantic_model_creator(
    ParticipationModel, name='CreateParticipationSchema', exclude=('id',)
)

FullInfo = pydantic_model_creator(
    InfoModel, name='GetInfoSchema'
)
FullParticipation = pydantic_model_creator(
    ParticipationModel, name='ParticipationModelSchema'
)


class CreateAll(BaseModel):
    participation: CreateParticipation
    info: CreateInfo
    company: CreateCompany


class GetAll(BaseModel):
    participation: FullParticipation
    info: FullInfo
    company: CompaniesSchema
# class CreateCompany(BaseModel):
#     name: str
#     desc: str
#     pic: str