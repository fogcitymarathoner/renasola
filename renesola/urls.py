from django.conf.urls import patterns, include, url

from django.contrib import admin
from django.conf import settings

from views import HomeView
from rest_framework import routers, serializers, viewsets
from renesola_routers import router
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'renesola.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^'+settings.SUB_URL+'$', HomeView.as_view(), name='home'),
    url(r'^'+settings.SUB_URL+'admin/', include(admin.site.urls)),

    # WEIRDNESS - the following url must preceed 'bootstrap' and 'angular'
    # gets over wrote by 'angular'
    url(r'^'+settings.SUB_URL+'angular_bootstrap', include('angular_bootstrap_templateviewer.urls')),
    url(r'^'+settings.SUB_URL+'bootstrap', include('bootstrap_templateviewer.urls')),
    url(r'^'+settings.SUB_URL+'angular', include('angular_templateviewer.urls')),

    url(r'^'+settings.SUB_URL+'crm', include('pricing.crm.urls')),
    url(r'^'+settings.SUB_URL+'freight', include('freight.urls')),
    url(r'^api/', include(router.urls)),
    # restframework login logout urls
    url(r'^api-auth/', include('rest_framework.urls',
                               namespace='rest_framework')),
)
