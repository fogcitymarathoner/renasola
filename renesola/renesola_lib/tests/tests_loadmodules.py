__author__ = 'marc'
from django.test import TestCase
class SimpleTest(TestCase):

    def test_import(self):
        """
        test import pricing
        """
        try:
            import renesola_lib
        except ImportError:
            self.assertTrue(False)

    def test_import_renasola_lib_cvs(self):
        """
        test import pricing
        """
        try:
            import renesola_lib.import_cvs
        except ImportError:
            self.assertTrue(False)

    def test_import_renasola_lib_cvs_setting(self):
        """
        test import pricing
        """
        try:
            import renesola_lib.import_cvs_settings
        except ImportError:
            self.assertTrue(False)

    def test_import_renasola_lib_iron_ridge(self):
        """
        test import pricing
        """
        try:
            import renesola_lib.import_iron_ridge
        except ImportError:
            self.assertTrue(False)

    def test_import_renasola_lib_iron_ridge_settings(self):
        """
        test import pricing
        """
        try:
            import renesola_lib.import_iron_ridge_settings
        except ImportError:
            self.assertTrue(False)
    def test_import_renasola_lib_product_packaging(self):
        """
        test import pricing
        """
        try:
            import renesola_lib.import_product_packaging
        except ImportError:
            self.assertTrue(False)

    def test_import_renasola_lib_product_packaging_settings(self):
        """
        test import pricing
        """
        try:
            import renesola_lib.import_product_packaging_settings
        except ImportError:
            self.assertTrue(False)

    def test_import_renasola_lib_import_xl(self):
        """
        test import pricing
        """
        try:
            import renesola_lib.import_xl
        except ImportError:
            self.assertTrue(False)

    def test_import_renasola_lib_import_xl_settings(self):
        """
        test import pricing
        """
        try:
            import renesola_lib.import_xl_settings
        except ImportError:
            self.assertTrue(False)

    def test_import_mongo_models(self):
        """
        test import pricing
        """
        try:
            import renesola.renesola_lib.mongo_models
        except ImportError:
            self.assertTrue(False)

    def test_import_mongo_models_base(self):
        """
        test import pricing
        """
        try:
            import renesola.renesola_lib.mongo_models.mongo_model_base
        except ImportError:
            self.assertTrue(False)

    def test_import_mongo_models_products_packaging(self):
        """
        test import pricing
        """
        try:
            import renesola.renesola_lib.mongo_models.products_packaging
        except ImportError:
            self.assertTrue(False)
