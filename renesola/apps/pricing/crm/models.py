from django.db import models
from pricing.crm.crm_settings import PRICE_BREAKS

class ProductClassification(models.Model):
    description = models.CharField(max_length=200, unique=True)
    class Meta:
        db_table  = 'pricing_productclassification'
        verbose_name_plural = "Product Classifications"



class Product(models.Model):
    description = models.CharField(max_length=200, unique=True)

    book_region = models.CharField(max_length=20)
    product_classification = models.ForeignKey(ProductClassification, related_name='products')

    class Meta:
        db_table  = 'pricing_product'
        verbose_name_plural = "Products"

class Price(models.Model):
    description = models.CharField(max_length=200, choices=PRICE_BREAKS)
    product = models.ForeignKey(Product, related_name='prices')
    price = models.DecimalField(max_digits=11, decimal_places=3)

    price_break_quantity = models.IntegerField('Price Break QTY', default = 0)
    class Meta:
        db_table  = 'pricing_price'
        verbose_name_plural = "Prices"
        ordering = ['product__description', 'description']