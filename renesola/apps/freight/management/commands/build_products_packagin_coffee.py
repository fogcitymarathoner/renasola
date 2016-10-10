__author__ = 'marc'
from django.core.management.base import BaseCommand

import os

from renesola_lib.import_product_packaging import build_categories_coffee

class Command(BaseCommand):
    """
    field delimiter ';'
    text delmiter '"'
    """
    args = ''
    help = ''
    def handle(self, *args, **options):
        build_categories_coffee()