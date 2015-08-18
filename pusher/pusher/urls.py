from django.conf.urls import patterns, include, url
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns(
    '',
    url(r'^api/messages/$', 'notifications.views.api_message_list_create', name='api-message-list-create'),
    url(r'^api/messages/(?P<pk>\d+)/$', 'notifications.views.api_message_retrieve', name='api-message-retrieve'),
    url(r'^messages/$', 'notifications.views.message_list', name='message-list'),
    url(r'^admin/', include(admin.site.urls)),
)
