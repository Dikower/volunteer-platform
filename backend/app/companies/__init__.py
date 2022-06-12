from tortoise import Tortoise

from .controllers import router


def init(app):
    app.include_router(router, prefix='/companies', tags=['Companies'])
    # Tortoise.init_models(['app.companies.models'], 'companies')