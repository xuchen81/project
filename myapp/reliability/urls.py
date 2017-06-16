# -*- coding: utf-8 -*-

from django.conf.urls import include, url

from reliability.views import TestTemplateView


urlpatterns = [
    url(r'^test/?$', TestTemplateView.as_view(), name="test_view"),
]
