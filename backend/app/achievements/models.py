from tortoise import fields, Model, Tortoise


class AchievementModel(Model):
    id = fields.UUIDField(pk=True)
    name = fields.CharField(max_length=128)
    pic = fields.CharField(max_length=1024)
    progress = fields.IntField()
    total = fields.IntField()
    user = fields.ForeignKeyField('users.User', related_name='achievements')

    class PydanticMeta:
        exclude = ['user']