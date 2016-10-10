__author__ = 'marc'
import requests
payload = {
    'from_addr_postal_code': '94043',
    'to_addr_postal_code': '20500',
    'weight': '100',
    'dim_length': '48',
    'dim_width': '80',
    'dim_height': '44'
}

r = requests.post('http://renesola_php.sfcrowd.com/rate', params=payload)

print r.text