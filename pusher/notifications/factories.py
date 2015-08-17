import factory

class MessageFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = 'notifications.Message'
