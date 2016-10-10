__author__ = 'marc'

from django_webtest import WebTest
from django.test.client import RequestFactory
from django.core.urlresolvers import reverse
from django.contrib.auth.models import User
from django.contrib.auth.models import Group
from pricing.crm.views import PriceListUploadStatusView
import re

class WebTest(WebTest):

    def test_load_discount_calculator(self):
        """
        Ensure that page discount_calculator loads -- 200
        """

        factory = RequestFactory()

        c0_url = reverse('discount_calculator')

        resp = self.app.get(c0_url).maybe_follow()
        self.assertEqual(resp.status_int, 200)

    def test_load_crm_index(self):
        """
        Ensure that page crm_index loads -- 200
        """

        factory = RequestFactory()

        c0_url = reverse('crm_index')

        resp = self.app.get(c0_url).maybe_follow()
        self.assertEqual(resp.status_int, 200)

    def test_load_pricelist_uploader(self):
        """
        Ensure that page crm_index loads -- 200
        """

        factory = RequestFactory()

        c0_url = reverse('pricelist_uploader')

        resp = self.app.get(c0_url).maybe_follow()
        self.assertEqual(resp.status_int, 200)


    def test_pricelist_post_upload_info(self):
        """
        Ensure that page crm_index loads -- 200
        """

        factory = RequestFactory()

        c0_url = reverse('pricelist_post_upload_info')

        resp = self.app.get(c0_url).maybe_follow()
        self.assertEqual(resp.status_int, 200)

    def test_racking_descriptions_upload(self):
        """
        Ensure that page racking import upload loads -- 200
        """

        factory = RequestFactory()

        c0_url = reverse('racking_descriptions_uploader')

        resp = self.app.get(c0_url).maybe_follow()
        self.assertEqual(resp.status_int, 200)

    def test_pricelist_post_upload_info_status_service(self):
        """
        Ensure that service feeding ajax status of pricelist loads -- 200
        """

        factory = RequestFactory()

        c0_url = reverse('pricelist_post_upload_info_status_service')

        request = factory.get(c0_url, HTTP_X_REQUESTED_WITH='XMLHttpRequest')#.maybe_follow()
        resp = PriceListUploadStatusView.get_ajax(request)
        print resp
        self.assertEqual(resp.status_int, 200)


