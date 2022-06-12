from tortoise import fields, Model, Tortoise


class ArticleModel(Model):
    id = fields.UUIDField(pk=True)
    title = fields.CharField(default="Название статьи", max_length=1024)
    article = fields.TextField(default="# Сама статья")
    creation_date = fields.DatetimeField(auto_now=True)

    user = fields.ForeignKeyField('users.User', related_name='articles')

    # id = fields.IntField(pk=True)

    class PydanticMeta:
        exclude = ['user']