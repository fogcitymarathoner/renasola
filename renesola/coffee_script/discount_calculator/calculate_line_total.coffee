#
# calculate_line_total.coffee
# Depends on urls.coffee


calculate_product_line_total = (row_id) ->
  #
  # calculate calculate salesprice x quantity
  # and insert into line-item-subtotal-###
  #
  price = $('#sales-price-'+row_id).val()
  quantity = $('#product-quantity-'+row_id).val()

  total = price * quantity
  $('#line-item-subtotal-'+row_id).html total.toFixed(2)

calculate_racking_line_total = (row_id) ->
  #
  # calculate calculate salesprice x quantity
  # and insert into line-item-subtotal-###
  #
  price = parseFloat($('input#racking-price-'+row_id).val())
  quantity = parseFloat($('input#racking-quantity-'+row_id).val())
  alert price + ':' + quantity
  total = price * quantity

  #console.log price + '*' + quantity
  #console.log 'changing racking subtotal to - ' + total

  $('#racking-line-item-subtotal-'+row_id).html total.toFixed(2)

# NOTE - BLANK LINE BELOW NECESSARY
