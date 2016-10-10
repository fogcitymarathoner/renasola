__author__ = 'marc'
from django.conf.urls import patterns, include, url

from django.contrib import admin

from angular_templateviewer.views import AngularView

admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'renesola.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'/$', AngularView.as_view(), name='angular_index'),
)
