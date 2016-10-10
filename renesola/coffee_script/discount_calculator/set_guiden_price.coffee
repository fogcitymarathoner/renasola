#
# set_guiden_price.coffee
#

set_guiden_price = (row_id, price_break, guiden_price_element, sales_price_element) ->
  console.log 'setting product price(global) product price element, guiden price element'
  # set in-memory price cache
  set_product_price(row_id, price_break)
  # set page elements
  guiden_price_element.html price_break
  sales_price_element.val price_break





# NOTE - BLANK LINE BELOW NECESSARY
