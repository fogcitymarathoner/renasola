__author__ = 'marc'
from django.core.management.base import BaseCommand

from django.conf import settings
import os

from renesola_lib.angular_helpers import build_products_packaging_js
class Command(BaseCommand):
    """
    field delimiter ';'
    text delmiter '"'
    """
    args = ''
    help = ''
    def handle(self, *args, **options):
        build_products_packaging_js()

