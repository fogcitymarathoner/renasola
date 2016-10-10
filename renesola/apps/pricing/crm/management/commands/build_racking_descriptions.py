__author__ = 'marc'
from django.core.management.base import BaseCommand

import os

from renesola_lib.import_iron_ridge import build_racking_descriptions_coffee

class Command(BaseCommand):
    """
    field delimiter ';'
    text delmiter '"'
    """
    args = ''
    help = ''
    def handle(self, *args, **options):
        build_racking_descriptions_coffee()