__author__ = 'marc'
"""
This file demonstrates writing tests using the unittest module. These will pass
when you run "manage.py test".

Replace this with more appropriate tests for your application.
"""
from django.test import TestCase
class SimpleTest(TestCase):

    def test_import(self):
        """
        test import renesola
        """
        try:
            import renesola
        except ImportError:
            self.assertTrue(False)

    def test_context_processors_import(self):
        """
        test import renesola.context_processors
        """
        try:
            import renesola.context_processors
        except ImportError:
            self.assertTrue(False)
    def test_routers_import(self):
        """
        test import renesola.renesola_routers
        """
        try:
            import renesola.renesola_routers
        except ImportError:
            self.assertTrue(False)
    def test_settings_import(self):
        """
        test import renesola.settings
        """
        try:
            import renesola.settings
        except ImportError:
            self.assertTrue(False)

    def test_urls_import(self):
        """
        test import renesola.urls
        """
        try:
            import renesola.urls
        except ImportError:
            self.assertTrue(False)
    def test_views_import(self):
        """
        test import renesola.views
        """
        try:
            import renesola.views
        except ImportError:
            self.assertTrue(False)