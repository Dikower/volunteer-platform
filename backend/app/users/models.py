from tortoise import fields, Model

# TODO подписки
# TODO Кол-во выполненных заданий


class User(Model):
    id = fields.UUIDField(pk=True)
    name = fields.CharField(null=True, max_length=128)
    email = fields.CharField(unique=True, max_length=512)
    auth_token = fields.CharField(null=True, max_length=1024)
    avatar = fields.CharField(null=True, max_length=512, default="https://api.lorem.space/image/face?hash=88560")
    hashed_password = fields.CharField(max_length=512)
    creation_date = fields.DatetimeField(auto_now=True)

    profile_type = fields.CharField(default="person", max_length=16)  # person | company
    interests = fields.TextField(default='["Волонтерство", "Животные", "Технологии"]')  # JSON of strings
    completed_tasks = fields.TextField(default="[]")  # JSON of ints for chart

    def __repr__(self):
        return str(self.name)

    class PydanticMeta:
        exclude = ["hashed_password"]


class Token(Model):
    id = fields.IntField(pk=True)
    login_token = fields.CharField(max_length=2048)
    is_used = fields.BooleanField(default=False)
