from tortoise import Tortoise

from .controllers import router


def init(app):
    app.include_router(router, prefix="/users", tags=["Users"])
