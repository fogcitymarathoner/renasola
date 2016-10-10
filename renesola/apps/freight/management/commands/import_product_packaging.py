__author__ = 'marc'
from django.core.management.base import BaseCommand

from django.conf import settings
import os

from kombu import Connection

from kombu_workers.send_task_interface import send_as_task
from renesola_lib.import_product_packaging import import_product_packaging
BASE_DIR = os.path.dirname(__file__)
DATA_FILE = 'Prod Packaging Spec for Frt Calculator.xlsx'
class Command(BaseCommand):
    """
    field delimiter ';'
    text delmiter '"'
    """
    args = ''
    help = ''
    def handle(self, *args, **options):
        xlfile = os.path.join(BASE_DIR, DATA_FILE)
        print 'importing spreadsheet %s'%xlfile
        connection = Connection('amqp://guest:guest@localhost:%s//'%settings.KOMBU_WORKER_PORT)

        send_as_task(connection, fun=import_product_packaging, args=(xlfile, ), kwargs={},
                 priority='high')
