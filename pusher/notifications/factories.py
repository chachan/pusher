import factory
from faker import Factory as FakerFactory

faker = FakerFactory.create()

class MessageFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = 'notifications.Message'

    content = factory.LazyAttribute(lambda x: faker.sentence(nb_words=6, variable_nb_words=True))
    level = factory.LazyAttribute(lambda x: faker.job())
