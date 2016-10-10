__author__ = 'marc'
from renesola_lib.mongo_models.products_packaging import ProductPackaging

import os
import tenjin
from tenjin.helpers import *
from django.conf import settings
def build_js():
    products = ProductPackaging().all_details_dict_pallet()

    data = {
        'products': products
    }

    engine = tenjin.Engine(path=[settings.TENJIN_TEMPLATES_DIR])


    txt = engine.render('js.pyhtml', data)

    print txt
def build_products_packaging_js():
    products = ProductPackaging().all_details_dict()

    data = {
        'products': products
    }

    engine = tenjin.Engine(path=[settings.TENJIN_TEMPLATES_DIR])


    txt = engine.render('product_packaging_json.pyhtml', data)

    print txt
def build_html():
    products = ProductPackaging().all_details_dict()

    data = {
        'products': products
    }

    engine = tenjin.Engine(path=['renesola/apps/freight/templates/freight/angular_helpers'])


    txt = engine.render('html.pyhtml', data)

    print txt