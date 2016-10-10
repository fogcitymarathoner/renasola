__author__ = 'marc'

from django_webtest import WebTest
from django.test.client import RequestFactory
from django.core.urlresolvers import reverse
from django.contrib.auth.models import User
from django.contrib.auth.models import Group
import re

class WebTest(WebTest):

    def test_load_bootstrap_index(self):
        """
        Ensure that page bootstrap_index loads -- 200
        """

        factory = RequestFactory()

        c0_url = reverse('bootstrap_index')

        resp = self.app.get(c0_url).maybe_follow()
        self.assertEqual(resp.status_int, 200)
