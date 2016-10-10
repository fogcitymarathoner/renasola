#
# get_current_product_id
get_current_product_id = (cat, prod) ->
  #console.log 'looking up prod id for ' + cat + ":" +prod
  #
  # get product dictionary object data.coffee
  #
  for category in CategoryList
    for product in category['products']
      ########################## end of debug
      if category['description'] == cat and product['description'] == prod
        current_product = product['id']
        break
  return current_product
# get_current_product_category_description_from_product_id
get_current_product_category_description_from_product_id = (current_product) ->
  #console.log 'looking up category_description for ' + cat + ":" +prod
  #
  # get product dictionary object data.coffee
  #
  for category in CategoryList
    for product in category['products']
      ########################## end of debug
      if product['id'] == current_product
        category_description = category['description']
        break
  return category_description


# get_current_product_category_description_from_product_description
get_current_product_category_description_from_product_description = (current_product_description) ->
  #console.log 'looking up category_description for ' + cat + ":" +prod
  #
  # get product dictionary object data.coffee
  #
  for category in CategoryList
    for product in category['products']
      ########################## end of debug
      if product['description'] == current_product_description
        category_description = category['description']
        break
  return category_description

is_solar_module_product_description = (current_product_description) ->
  category = get_current_product_category_description_from_product_description(current_product_description)
  if category == 'Solar Modules'
    return true
  else
    return false
is_solar_module_product_id = (current_product_id) ->
  category = get_current_product_category_description_from_product_id(current_product_id)
  if category == 'Solar Modules'
    return true
  else
    return false

get_wattage = (data, index) ->
  product_description = data['description']
  wattage_string = product_description[2]+product_description[3]+product_description[4]
  wattage = parseInt(wattage_string)

after_wattage_price = (data, index) ->
  product_description = data['description']
  # multiply by wattage implied in product_description
  wattage = get_wattage(data, index)
  #console.log 'SOLAR MODULE - multiplying by watt price ' + data.prices[0]['price'] + ' by wattage ' + wattage
  return parseFloat(data.prices[index]['price']) * wattage


# NOTE - BLANK LINE BELOW NECESSARY
