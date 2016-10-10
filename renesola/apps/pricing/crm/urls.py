__author__ = 'marc'
from django.conf.urls import patterns, include, url

from pricing.crm.views import PricingCrmIndexView
from pricing.crm.views import DiscountCalculatorView
from pricing.crm.views import UploadPricelistView
from pricing.crm.views import UploadPricelistInfoView
from pricing.crm.views import UploadRackingDescriptionsView
from pricing.crm.views import PriceListUploadStatusView
from pricing.crm.views import RackingListUploadStatusView
from pricing.crm.views import UploadRackingDescriptionsInfoView

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'renesola.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'/discount_calculator/$', DiscountCalculatorView.as_view(), name='discount_calculator'),
    # upload Pages
    url(r'/price-uploader/$', UploadPricelistView.as_view(), name='pricelist_uploader'),
    url(r'/racking-descriptions-uploader/$', UploadRackingDescriptionsView.as_view(), name='racking_descriptions_uploader'),
    # service
    url(r'/price-post-upload-status/$', PriceListUploadStatusView.as_view(), name='pricelist_post_upload_info_status_service'),
    url(r'/racking-post-upload-status/$', RackingListUploadStatusView.as_view(), name='racking_post_upload_info_status_service'),
    # consumer
    url(r'/price-post-upload/$', UploadPricelistInfoView.as_view(), name='pricelist_post_upload_info'),
    url(r'/racking-descriptions-post-upload/$', UploadRackingDescriptionsInfoView.as_view(), name='upload_racking_descriptions'),
    # this must be last
    url(r'/$', PricingCrmIndexView.as_view(), name='crm_index'),
)
