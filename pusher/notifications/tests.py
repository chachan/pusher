import pytest
import json
from . import factories
from django.test import Client

pytestmark = pytest.mark.django_db

@pytest.mark.django_db
def test_get_messages():
    factories.MessageFactory.create_batch(size=10)
    c = Client()
    response = c.get('/messages/')
    json_response = json.loads(response.content)
    assert len(json_response) == 10
    assert len(json_response[0]['content']) > 0
    assert len(json_response[0]['level']) > 0
    
@pytest.mark.django_db
def test_post_messages():
    c = Client()
    data = {
        'content': 'This is a content',
        'level': 'This is a level'
    }
    response = c.post('/messages/', data)
    json_response = json.loads(response.content)
    assert data['content'] == json_response['content']
    assert data['level'] == json_response['level']
    assert len(json_response['created_at_natural']) > 0
    assert isinstance(json_response['pk'], int)