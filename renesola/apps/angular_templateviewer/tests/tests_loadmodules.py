__author__ = 'marc'
"""
This file demonstrates writing tests using the unittest module. These will pass
when you run "manage.py test".

Replace this with more appropriate tests for your application.
"""
from django.test import TestCase
class SimpleTest(TestCase):

    def test_urls_import(self):
        """
        test import angular_templateviewer.urls
        """
        try:
            import angular_templateviewer.urls
        except ImportError:
            self.assertTrue(False)

    def test_views_import(self):
        """
        test import angular_templateviewer.views
        """
        try:
            import angular_templateviewer.views
        except ImportError:
            self.assertTrue(False)