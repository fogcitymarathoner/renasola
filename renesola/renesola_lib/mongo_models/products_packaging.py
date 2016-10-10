__author__ = 'marc'

from renesola.renesola_lib.mongo_models.mongo_model_base import MongoBaseModel
from django.template.defaultfilters import slugify

from inflector import Inflector, English
class ProductPackaging(MongoBaseModel):

    def __init__(self):

        MongoBaseModel.__init__(self)

        self.product_packaging = self.db.products_packaging
        self.inflector = Inflector(English)
    def get(self, product):
        """

        :param product:
        :return: products_packaging obj
        """

        return self.product_packaging.find_one(category=product)

    def empty_out(self):

        # clear out products_packaging collecion and products document
        for c in self.product_packaging.find():
            self.product_packaging.remove(c)
    def insert(self, c):
        self.product_packaging.insert(c)


    def all(self):
        products = []
        for c in self.product_packaging.find():

            if c['category'] != 'Wooden Pallet':
                products.append(c['category'])
        return products
    def all_details(self):
        products = []
        for c in self.product_packaging.find():

            if c['category'] != 'Wooden Pallet':
                products.append(c)
        return products
    def all_details_dict_pallet(self):
        products = {}
        for c in self.product_packaging.find():

            o = {
                'category':c['category'],
                'category_slug':slugify(c['category']),
                'category_camel':self.inflector.camelize(c['category']),
                'pallet_spec': {
                    'length':c['pallet_spec']['length'],
                    'width':c['pallet_spec']['width'],
                    'height':c['pallet_spec']['height'],
                    'weight':c['pallet_spec']['weight'],
                    'quantity':c['pallet_spec']['quantity']
                },
                'carton_spec': {
                    'length':c['carton_spec']['length'],
                    'width':c['carton_spec']['width'],
                    'height':c['carton_spec']['height'],
                    'weight':c['carton_spec']['weight'],
                    'quantity':c['carton_spec']['quantity']
                },
                'unit_spec': {
                    'length':c['unit_spec']['length'],
                    'width':c['unit_spec']['width'],
                    'height':c['unit_spec']['height'],
                    'weight':c['unit_spec']['weight'],
                },
                'minimum_packing_unit':c['minimum_packing_unit'],
                'freight_class':c['freight_class'],
            }
            products[o['category_camel']] = o
        return products
    def all_details_dict(self):
        """
        Strips WoodenPallet of list object payload
        :return:
        """
        products_trimmed = {}
        qset = self.all_details_dict_pallet()
        for c in qset:
            if c != 'WoodenPallet':
                products_trimmed[c] = qset[c]
        return products_trimmed