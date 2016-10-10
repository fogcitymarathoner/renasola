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
        url = reverse('discount_calculator')

        pattern = '/'+settings.SUB_URL+'crm/discount_calculator/$'

        matched = re.search(pattern, url)
        self.assertTrue(matched)

        url = reverse('crm_index')

        pattern = '/'+settings.SUB_URL+'crm/$'
        matched = re.search(pattern, url)
        self.assertTrue(matched)

        url = reverse('pricelist_uploader')

        pattern = '/'+settings.SUB_URL+'crm/price-uploader/$'
        matched = re.search(pattern, url)
        self.assertTrue(matched)


        url = reverse('pricelist_post_upload_info')

        pattern = '/'+settings.SUB_URL+'crm/price-post-upload/$'
        matched = re.search(pattern, url)
        self.assertTrue(matched)



        url = reverse('pricelist_post_upload_info_status_service')

        pattern = '/'+settings.SUB_URL+'crm/price-post-upload-status/$'
        matched = re.search(pattern, url)
        self.assertTrue(matched)


        url = reverse('racking_descriptions_uploader')

        pattern = '/'+settings.SUB_URL+'crm/racking-descriptions-uploader/$'
        matched = re.search(pattern, url)
        self.assertTrue(matched)

