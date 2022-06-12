from tortoise import fields, Model, Tortoise


class ActivityModel(Model):
    id = fields.UUIDField(pk=True)
    name = fields.CharField(max_length=128)
    description = fields.TextField()
    date = fields.CharField(max_length=16)
    location = fields.CharField(max_length=32)
    type = fields.CharField(max_length=32)
    tasks = fields.TextField()  # Plain text with \n for iOS
    participants = fields.TextField(default=["[]"])  # JSON of links to img
    participation_type = fields.CharField(default="online", max_length=16)  # online | offline
    image = fields.TextField(default="/events/default.jpg")

    company = fields.ForeignKeyField('users.User', related_name='activities')

    # for IOS
    isHot = fields.BooleanField(default=True)
    lowerBorderOfMembersAmount = fields.IntField(default=30)


    class PydanticMeta:
        exclude = ['user']