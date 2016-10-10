__author__ = 'marc'
from django.views.generic import TemplateView

class BootstrapView(TemplateView):
    template_name = "bootstrap_templateviewer/index.html"
