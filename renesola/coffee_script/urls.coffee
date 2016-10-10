# urls.coffee
# depends on settings.coffee


products_prices_url = settings['rest_api_url']+'products-prices/'
pricelist_upload_status_url = settings['pricelist_upload_status_url']
racking_upload_status_url = settings['racking_upload_status_url']
packaging_data_url = settings['packaging_data_url']
####################################################################
#
# PricesList - store product prices as such
#
# from API Call https://renesola.fogtest.com/api/products/845/
# Product Can have 2 or 4 prices
# PricesList = [{
#      "845": {
#      "id": 845,
#      "description": "RLP036I0101_3518020300410",
#      "prices": [
#          {
#              "id": 2281,
#              "description": "0",
#              "price": "71.50",
#              "price_break_quantity": 499
#          },
#          {
#              "id": 2282,
#              "description": "1",
#              "price": "58.18",
#              "price_break_quantity": 999
#          },
#          {
#              "id": 2283,
#              "description": "2",
#              "price": "10.07",
#              "price_break_quantity": 4999
#          },
#          {
#              "id": 2284,
#              "description": "3",
#              "price": "9.57",
#              "price_break_quantity": 999999
#          }
#      ]
#  }
# }]
####################################################################

# NOTE - BLANK LINE BELOW NECESSARY
