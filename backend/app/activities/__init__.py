from tortoise import Tortoise

from .controllers import router


def init(app):
    app.include_router(router, prefix='/activities', tags=['Activities'])
    Tortoise.init_models(['app.activities.models'], 'activities')