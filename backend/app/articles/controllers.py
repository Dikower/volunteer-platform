from typing import List

from fastapi import APIRouter, Depends, HTTPException

from .models import ArticleModel
from .schemas import CreateArticle, ArticlesSchema
from ..users.auth import get_user
from ..users.models import User

router = APIRouter()


async def check_article(id: str, user: User = Depends(get_user)):
    article = await ArticleModel.get_or_none(id=id)
    if article is None:
        raise HTTPException(404, 'Article not found')
    if article.user_id != user.id:
        raise HTTPException(403, 'User does not have access to this')
    return article


@router.get('/all', response_model=List[ArticlesSchema])
async def get_all():
    return await ArticlesSchema.from_queryset(ArticleModel.all())


@router.post('/', response_model=ArticlesSchema)
async def create_article(new_article: CreateArticle, user: User = Depends(get_user)):
    article = await ArticleModel.create(**new_article.dict(), user_id=user.id)
    return await ArticlesSchema.from_tortoise_orm(article)


@router.get('/{id}', response_model=ArticlesSchema)
async def get_my(article: ArticleModel = Depends(check_article)):
    return await ArticlesSchema.from_tortoise_orm(article)


@router.put('/', response_model=ArticlesSchema)
async def edit_article(edited_article: CreateArticle, article: ArticleModel = Depends(check_article)):
    await article.update_from_dict(edited_article.dict())
    await article.save()
    return await ArticlesSchema.from_tortoise_orm(article)


@router.delete('/')
async def delete_article(article: ArticleModel = Depends(check_article)):
    await article.delete()
    return {'ok': True}