__author__ = 'marc'


from django.conf import settings
from pymongo import MongoClient

class MongoBaseModel:

    def __init__(self):

        client = MongoClient()
        self.db = client[settings.MONGO_DB]