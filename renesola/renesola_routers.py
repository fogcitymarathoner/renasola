__author__ = 'marc'



from rest_framework import routers
from pricing.crm.views import ProductClassificationViewSet
from pricing.crm.views import ProductViewSet
from pricing.crm.views import ProductPriceViewSet


from pricing.crm.views import PriceViewSet
router = routers.DefaultRouter()
router.register(r'product-classifications', ProductClassificationViewSet)
router.register(r'products', ProductViewSet)
router.register(r'products-prices', ProductPriceViewSet)
router.register(r'prices', PriceViewSet)