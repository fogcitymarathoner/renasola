__author__ = 'marc'
from django.views.generic import TemplateView


class AngularView(TemplateView):
    template_name = "angular_templateviewer/index.html"