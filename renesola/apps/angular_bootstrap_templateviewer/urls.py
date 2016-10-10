__author__ = 'marc'
__author__ = 'marc'
from django.conf.urls import patterns, include, url

from django.contrib import admin

from angular_bootstrap_templateviewer.views import AngularBootstrapView

admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'renesola.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'/$', AngularBootstrapView.as_view(), name='angular_bootstrap_index'),
)
