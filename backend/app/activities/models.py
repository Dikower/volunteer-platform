from tortoise import fields, Model, Tortoise


class ActivityModel(Model):
    id = fields.UUIDField(pk=True)
    title = fields.CharField(max_length=128)
    location = fields.CharField(max_length=32)
    type = fields.CharField(max_length=32)
    isHot = fields.BooleanField()
    lastThreeMembers = fields.TextField()
    lowerBorderOfMembersAmount = fields.IntField()

    user = fields.ForeignKeyField('users.User', related_name='activities')

    class PydanticMeta:
        exclude = ['user']