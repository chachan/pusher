from django.conf.urls import patterns, include, url
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns(
    '',
    url(r'^messages/$', 'notifications.views.message_list_create', name='message-list-create'),
    url(r'^messages/(?P<pk>\d+)/$', 'notifications.views.message_retrieve', name='message-retrieve'),
    url(r'^admin/', include(admin.site.urls)),
)
