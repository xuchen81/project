from django.views import View
from django.http import HttpResponse
from django.views.generic import TemplateView


class PingView(View):

    def get(self, request, *args, **kwargs):
        return HttpResponse("Status OK!", content_type="text/plain")


class TestTemplateView(TemplateView):
    template_name = "test.html"
