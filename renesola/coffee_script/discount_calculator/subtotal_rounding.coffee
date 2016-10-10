
#
# subtotal_rounding.coffee
# returns quantity*sales-price rounded to to decimals
# cleans up validate_price_do_line_calculations.coffee
#

solar_module_subtotal = (data, quantity, sales_price_element, sbreak) ->
  console.log('wattage = ' + get_wattage(data, sbreak).toFixed(2))
  (((((parseFloat(sales_price_element.val()).toFixed(3) * 1000) / 1000).toFixed(3)) * quantity.toFixed(2)).toFixed(2) * get_wattage(data, sbreak).toFixed(2)).toFixed(2)
non_solar_module_subtotal = (sales_price_element, quantity) ->
  ((((parseFloat(sales_price_element.val()).toFixed(3) * 1000) / 1000).toFixed(3)) * quantity.toFixed(2)).toFixed(2)

# NOTE - BLANK LINE BELOW NECESSARY

