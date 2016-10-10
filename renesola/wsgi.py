"""
WSGI config for renesola project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.6/howto/deployment/wsgi/
"""

import os
import sys

BASE_DIR = os.path.dirname(__file__)
#BASEDIR = /var/www ???
# make sure we can import off dir with settings.py
sys.path.insert(0, BASE_DIR)
sys.path.insert(0, os.path.join(BASE_DIR,'..'))

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "settings")

from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()
