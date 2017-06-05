from __future__ import absolute_import

import os
import socket
import logging

from celery import Celery
from celery.utils.log import get_task_logger
from django.conf import settings


settings_module = os.environ.get('DEPLOYMENTHOST')
if not settings_module:
    raise EnvironmentError(
        'DEPLOYMENTHOST missing from environment. Aborting.')

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'myapp.settings.' + settings_module)
app = Celery('myapp')

app.config_from_object('django.conf:settings')
app.autodiscover_tasks(lambda: settings.INSTALLED_APPS)
