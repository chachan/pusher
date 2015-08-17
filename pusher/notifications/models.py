from django.db import models
from django.utils import timezone
import datetime
from babel.dates import format_timedelta


class Message(models.Model):
    content = models.CharField(max_length=500)
    level = models.CharField(max_length=30)
    created_at = models.DateTimeField(auto_now_add=True)
    
    @property
    def created_at_natural(self):
        delta = timezone.now() - self.created_at
        return '{} ago'.format(format_timedelta(delta, locale='en_US'))

    def __unicode__(self):
        return 'Content: {} | Level: {} | created_at'.format(self.content, self.level, self.created_at_natural)
