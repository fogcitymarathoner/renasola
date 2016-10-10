__author__ = 'marc'
"""
This file demonstrates writing tests using the unittest module. These will pass
when you run "manage.py test".

Replace this with more appropriate tests for your application.
"""
from django.test import TestCase
class SimpleTest(TestCase):


    def test_views_import(self):
        """
        test import freight.views
        """
        try:
            import freight.views
        except ImportError:
            self.assertTrue(False)



    def test_urls_import(self):
        """
        test import freight.views
        """
        try:
            import freight.urls
        except ImportError:
            self.assertTrue(False)


    def test_import(self):
        """
        test import freight.views
        """
        try:
            import freight
        except ImportError:
            self.assertTrue(False)


    def test_import_forms(self):
        """
        test import freight.views
        """
        try:
            import freight.forms
        except ImportError:
            self.assertTrue(False)

