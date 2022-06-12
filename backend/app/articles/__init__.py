from tortoise import Tortoise

from .controllers import router


def init(app):
    app.include_router(router, prefix='/articles', tags=['Articles'])
    Tortoise.init_models(['app.articles.models'], 'articles')