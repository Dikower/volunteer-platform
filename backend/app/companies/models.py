from tortoise import fields, Model, Tortoise


class InfoModel(Model):
    id = fields.UUIDField(pk=True)
    location = fields.CharField(default="Россия", max_length=128)
    staff = fields.CharField(default="5000-1000 человек", max_length=256)
    reg_date = fields.DatetimeField(auto_now=True)
    creation_date = fields.CharField(default='1998-10-15', max_length=128)
    responsible = fields.CharField(default="Гисина Анастасия", max_length=512)

    company = fields.OneToOneField('companies.CompanyModel', related_name='info')


class ParticipationModel(Model):
    id = fields.UUIDField(pk=True)
    volunteers = fields.IntField(default=12924)
    business = fields.IntField(default=30)
    tasks = fields.IntField(default=1000)
    retention = fields.FloatField(default=70.0)

    company = fields.OneToOneField('companies.CompanyModel', related_name="participation")


class CompanyModel(Model):
    id = fields.UUIDField(pk=True)
    img = fields.CharField(default='/companies/ozon.png', max_length=1024)
    name = fields.CharField(default='OZON.ru', max_length=256)
    desc = fields.TextField(default='Технологии, маркетплейс')
    top = fields.IntField(default=1)
    mark = fields.FloatField(default=5.0)  # from 0.0 to 5.0

    user = fields.ForeignKeyField('users.User', related_name='companies')

    class PydanticMeta:
        exclude = ['user']