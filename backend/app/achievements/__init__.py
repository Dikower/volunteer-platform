from tortoise import Tortoise

from .controllers import router


def init(app):
    app.include_router(router, prefix='/achievements', tags=['Achievements'])
    Tortoise.init_models(['app.achievements.models'], 'achievements')