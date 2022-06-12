from typing import Any, Optional

from pydantic import BaseModel
from tortoise.contrib.pydantic import pydantic_model_creator

from .models import ArticleModel

ArticlesSchema = pydantic_model_creator(
    ArticleModel, name='ArticlesSchema', exclude=(), include=()
)

CreateArticle = pydantic_model_creator(
    ArticleModel, name='CreateArticleSchema', exclude=(), include=('title', 'article')
)

# class CreateArticle(BaseModel):
#     title: Optional[str]
#     article: Optional[str]
