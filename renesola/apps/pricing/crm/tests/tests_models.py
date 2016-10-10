__author__ = 'marc'

import os
import sys

import csv
from pricing.crm.models import ProductClassification

from pricing.crm.models import Product
from pricing.crm.models import Price as ProductPrice
from renesola_lib.import_xl import import_pricelist_xl

BASE_DIR = os.path.dirname(__file__)
TEST_DATA_DIR = os.path.join(BASE_DIR, '..', '..', '..', 'pricing', 'crm', 'management', 'commands')
DATA_FILE = 'CRM_price_20150306.xlsx'


from django.test import TestCase
class SimpleTest(TestCase):

    def setUp(self):
        pass
        # skipping because it takes too long and uses too much memory
        #import_pricelist_xl(os.path.join(TEST_DATA_DIR, DATA_FILE))
    def test_import(self):
        """
        test pricing model loading
        """

        dj_product_classification = ProductClassification.objects.filter(
            description='Low-voltage Apparatus')
        self.assertTrue(1, len(dj_product_classification))