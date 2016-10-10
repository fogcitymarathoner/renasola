__author__ = 'marc'

import os
import sys
import json
import csv
from django.conf import settings

from django.shortcuts import render
from django.template import loader, Context
from pricing.crm.models import ProductClassification

from pricing.crm.models import Product
from pricing.crm.models import ProductClassification
from pricing.crm.models import Price as ProductPrice

def empty_pricelist_tables():
    while ProductClassification.objects.count():
        ids = ProductClassification.objects.values_list('pk', flat=True)[:100]
        ProductClassification.objects.filter(pk__in = ids).delete()
    while Product.objects.count():
        ids = Product.objects.values_list('pk', flat=True)[:100]
        Product.objects.filter(pk__in = ids).delete()
    while ProductPrice.objects.count():
        ids = ProductPrice.objects.values_list('pk', flat=True)[:100]
        ProductPrice.objects.filter(pk__in = ids).delete()
    """
    for o in ProductClassification.objects.all():
        o.delete()
    for o in Product.objects.all():
        o.delete()
    for o in ProductPrice.objects.all():
        o.delete()
    """