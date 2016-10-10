__author__ = 'marc'
from django.conf.urls import patterns, include, url

from django.contrib import admin
from django.conf import settings
from bootstrap_templateviewer.views import BootstrapView

admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'renesola.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'/$', BootstrapView.as_view(), name='bootstrap_index'),
)
