from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render, get_object_or_404
from notifications import models
from django.http import HttpResponse
import json
import tasks


def api_message_retrieve(request, pk):
    message = get_object_or_404(models.Message, pk=pk)
    message_with_natural_datetime = {
        'pk': pk,
        'content': message.content,
        'level': message.level,
        'created_at_natural': message.created_at_natural
    }
    response = json.dumps(message_with_natural_datetime)
    return HttpResponse(response, content_type='application/json')


@csrf_exempt
def api_message_list_create(request):
    if request.method == 'GET':
        messages = models.Message.objects.order_by('-created_at').all()
        messages_with_natural_datetime = []
        for each in messages:
            m = {
                'pk': each.pk,
                'content': each.content,
                'level': each.level,
                'created_at_natural': each.created_at_natural
            }
            messages_with_natural_datetime.append(m)
        response = json.dumps(messages_with_natural_datetime)
        return HttpResponse(response, content_type='application/json')
    elif request.method == 'POST':
        message = models.Message()
        message.content = request.POST.get('content', '')
        message.level = request.POST.get('level', '')
        message.save()
        message_with_natural_datetime = {
            'pk': message.pk,
            'content': message.content,
            'level': message.level,
            'created_at_natural': message.created_at_natural
        }
        response = json.dumps(message_with_natural_datetime)
        tasks.add_message.delay(response)
        return HttpResponse(response, content_type='application/json')


def message_list(request):
    messages = models.Message.objects.order_by('-created_at').all()
    return render(request, 'messages.html', {'messages': messages})
