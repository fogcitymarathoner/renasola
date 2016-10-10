__author__ = 'marc'

from django_webtest import WebTest
from django.test.client import RequestFactory
from django.core.urlresolvers import reverse
from django.contrib.auth.models import User
from django.contrib.auth.models import Group
import re

class WebTest(WebTest):

    def test_load_homepage(self):
        """
        Ensure that page homepage loads -- 200
        """

        factory = RequestFactory()

        c0_url = reverse('home')

        resp = self.app.get(c0_url).maybe_follow()
        self.assertEqual(resp.status_int, 200)
