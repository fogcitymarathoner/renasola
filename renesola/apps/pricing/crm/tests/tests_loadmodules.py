__author__ = 'marc'
"""
This file demonstrates writing tests using the unittest module. These will pass
when you run "manage.py test".

Replace this with more appropriate tests for your application.
"""
from django.test import TestCase
class SimpleTest(TestCase):

    def test_adminimport(self):
        """
        test import pricing.admin
        """
        try:
            import pricing.crm.admin
        except ImportError:
            self.assertTrue(False)

    def test_import(self):
        """
        test import pricing
        """
        try:
            import pricing
        except ImportError:
            self.assertTrue(False)
        try:
            import pricing.crm
        except ImportError:
            self.assertTrue(False)

    def test_crm_settings(self):
        """
        test import pricing.admin
        """
        try:
            import pricing.crm.crm_settings
        except ImportError:
            self.assertTrue(False)

    def test_models_import(self):
        """
        test import pricing.crm.models
        """
        try:
            import pricing.crm.models
        except ImportError:
            self.assertTrue(False)

    def test_serializers_import(self):
        """
        test import pricing.views
        """
        try:
            import pricing.crm.serializers
        except ImportError:
            self.assertTrue(False)

    def test_queues(self):
        """
        test import pricing.views
        """
        try:
            import pricing.crm.queues
        except ImportError:
            self.assertTrue(False)

    def test_views_import(self):
        """
        test import pricing.views
        """
        try:
            import pricing.crm.views
        except ImportError:
            self.assertTrue(False)
    def test_forms_import(self):
        """
        test import pricing.crm.forms
        """
        try:
            import pricing.crm.forms
        except ImportError:
            self.assertTrue(False)
    def test_command_build_categories(self):
        """
        test import pricing.crm.forms
        """
        try:
            import pricing.crm.management.commands.build_categories_coffee
        except ImportError:
            self.assertTrue(False)
    def test_command_import_xlpricelist(self):
        """
        test import pricing.crm.forms
        """
        try:
            import pricing.crm.management.commands.import_xlpricelist
        except ImportError:
            self.assertTrue(False)
    def test_urls_import(self):
        """
        test import pricing.urls
        """
        try:
            import pricing.crm.urls
        except ImportError:
            self.assertTrue(False)