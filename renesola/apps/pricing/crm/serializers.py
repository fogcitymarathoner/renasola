__author__ = 'marc'
from pricing.crm.models import ProductClassification

from pricing.crm.models import Product
from pricing.crm.models import Price
from rest_framework import serializers



class PriceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Price
        fields = ('id', 'description', 'price', 'price_break_quantity')

class ProductWithPricesSerializer(serializers.ModelSerializer):
    # slows down requests
    prices = PriceSerializer(many=True, read_only=True)
    class Meta:
        model = Product
        fields = ('id', 'description', 'prices')

class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = ('id', 'description')

class ProductClassificationSerializer(serializers.ModelSerializer):
    products = ProductSerializer(many=True, read_only=True)
    class Meta:
        model = ProductClassification
        fields = ('id', 'description', 'products')


