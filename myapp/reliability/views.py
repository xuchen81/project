from django.views import View
from django.http import HttpResponse


class PingView(View):

    def get(self, request, *args, **kwargs):
        return HttpResponse("Status OK!", content_type="text/plain")
