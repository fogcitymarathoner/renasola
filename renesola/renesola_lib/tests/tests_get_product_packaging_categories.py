__author__ = 'marc'
from django.test import TestCase

from renesola.renesola_lib.mongo_models.products_packaging import ProductPackaging

class SimpleTest(TestCase):

    def test_get_products(self):
        """
        test getting list ofr products for UI dropdown, verifying 'Wood Pallet' not in dropdown
        """
        self.assertTrue( 'Wood Pallet' not in ProductPackaging().all())

    def test_get_products_details(self):
        """
        test getting list ofr products for UI dropdown, verifying 'Wood Pallet' not in dropdown
        """
        products = ProductPackaging().all_details()

        self.assertTrue( 'Wood Pallet' not in products[0]['category'])



    def test_get_product(self):
        """
        test that shipping information is retrievable
        :return:
        """
        product_info = ProductPackaging().get('Wood Pallet')

        self.assertTrue( 'Wood Pallet', product_info['category'])
    def test_get_product_all_details_dict(self):
        """
        test that shipping information is retrievable
        :return:
        """
        product_info = ProductPackaging().all_details_dict()

        self.assertFalse( 'Wood Pallet', product_info[0]['category'])