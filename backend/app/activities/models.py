from tortoise import fields, Model, Tortoise


class ActivityModel(Model):
    id = fields.UUIDField(pk=True)
    name = fields.CharField(default="Какое-то задание", max_length=256)
    description = fields.TextField(default="Подробное описание какого-то задания")
    date = fields.CharField(default='2022-06-14', max_length=32)
    location = fields.CharField(default='Москва', max_length=64)
    type = fields.CharField(default="Стажировка", max_length=64)  # Стажировка, работа etc
    tasks = fields.TextField(default="Пойдти туда, не знаю куда.\n Сделать то, не знаю что")  # Plain text with \n for iOS
    participants = fields.TextField(default="[]")  # JSON of links to img
    participation_type = fields.CharField(default="online", max_length=32)  # online | offline
    image = fields.TextField(default="/events/default.jpg")
    creation_date = fields.DatetimeField(auto_now=True)

    # for IOS
    isHot = fields.BooleanField(default=True)
    lowerBorderOfMembersAmount = fields.IntField(default=30)

    user = fields.ForeignKeyField('users.User', related_name='activities')


    class PydanticMeta:
        exclude = ['user']