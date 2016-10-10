__author__ = 'marc'
# -*- coding: utf-8 -*-
"""
context_processor

Context processors for project.

"""

from django.conf import settings
from django.contrib.sites.models import Site
from django.core.urlresolvers import reverse, NoReverseMatch


def static_url(request):
    return {
        'static_url': settings.STATIC_URL,
    }
