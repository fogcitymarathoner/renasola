"""
This file demonstrates writing tests using the unittest module. These will pass
when you run "manage.py test".

Replace this with more appropriate tests for your application.
"""

import re

from django.test import TestCase

from django.core.urlresolvers import reverse

from django.conf import settings
class SimpleTest(TestCase):

    def test_reverse_urls(self):
        """
        test reverse of discount calculator
        """
        url = reverse('freight_calculator')

        pattern = '/'+settings.SUB_URL+'freight/freight_calculator/$'

        matched = re.search(pattern, url)
        self.assertTrue(matched)
