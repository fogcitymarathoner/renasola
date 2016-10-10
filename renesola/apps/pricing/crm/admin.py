from django.contrib import admin
from pricing.crm.models import Price
from pricing.crm.models import Product

class PriceInline(admin.TabularInline):
    model = Price

class ProductAdmin(admin.ModelAdmin):
    list_display = ('description')
    search_fields = ('discription')

    inlines = [
        PriceInline
    ]

# FIXME - ALREADY REGISTERED ERROR ????
#(Product, ProductAdmin)

