# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Message'
        db.create_table('notifications_message', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('content', self.gf('django.db.models.fields.CharField')(max_length=500)),
            ('level', self.gf('django.db.models.fields.CharField')(max_length=30)),
            ('created_at', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
        ))
        db.send_create_signal('notifications', ['Message'])


    def backwards(self, orm):
        # Deleting model 'Message'
        db.delete_table('notifications_message')


    models = {
        'notifications.message': {
            'Meta': {'object_name': 'Message'},
            'content': ('django.db.models.fields.CharField', [], {'max_length': '500'}),
            'created_at': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'level': ('django.db.models.fields.CharField', [], {'max_length': '30'})
        }
    }

    complete_apps = ['notifications']