__author__ = 'marc'
from django.views.generic import TemplateView


class AngularBootstrapView(TemplateView):
    template_name = "angular_bootstrap_templateviewer/index.html"
