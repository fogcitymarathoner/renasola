
#
# categories_products.coffee
#
# for caching retrieved product prices from CategoryProductSearchList
#


CategoryProductPricesList = []
CategoryProductSearchList = []
for cat in CategoryList
  for prod in cat['products']
    CategoryProductSearchList.push cat['description']+':'+prod['description']

set_category_product_prices = (data) ->
  #console.log 'category_product_prices'
  index = 0
  for p in CategoryProductPricesList
    if data.id == p.id
      # Changes item in list???
      #console.log 'replacing index ' + index + ' of CategoryProductPricesList'
      CategoryProductPricesList[index] = data
      return
    index = index + 1
  CategoryProductPricesList[index] = data


get_category_product_prices = (product) ->
  #console.log 'in get_category_product_prices'
  #console.log ' looking up product ' + product
  for p in CategoryProductPricesList
    #console.log p

    if p.id == product
      #console.log 'returning sales prices ' + p
      return p

# NOTE - BLANK LINE BELOW NECESSARY

