__author__ = 'marc'
from django.conf.urls import patterns, include, url

from freight.views import FreightIndexView

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'renesola.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'/freight_calculator/$', FreightIndexView.as_view(), name='freight_calculator'),
)
