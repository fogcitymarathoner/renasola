#
# set_product_package_set.coffee
#
set_product_package_set = (product, row_id) ->
  #
  # get guiden price and fill in defaults
  #
  ProductPackagingSets[row_id] = {'dimensions': product, 'quantity': 0}
  console.log ProductPackagingSets
  # REGISTERING CALLBACK
  $('.freight-calculator-input').unbind('change')
  $('.freight-calculator-input').change do_product_quantity_changed


# NOTE - BLANK LINE BELOW NECESSARY
