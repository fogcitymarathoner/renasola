__author__ = 'marc'
from django.test import TestCase
class SimpleTest(TestCase):

    def test_import(self):
        """
        test import pricing
        """
        try:
            import pricing
        except ImportError:
            self.assertTrue(False)
