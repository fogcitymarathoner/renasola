
# line_subtotal.coffee
#
# returns calculated subtotal off an item line

product_line_subtotal = (row_id) ->
  # skip non created subtotals, like row 1 at start up
  #
  #console.log 'product subtotal element ' + $('#line-item-subtotal-'+row_id).attr('id')

  quantity_element = $('#product-quantity-'+row_id)
  guiden_price_element = $('#line-item-guiden-price-'+row_id)
  sales_price_element = $('#sales-price-'+row_id)
  subtotal_element = $('#line-item-subtotal-'+row_id)
  message_element = $('#line-item-discount-message-'+row_id)
  if $('#line-item-subtotal-'+row_id).length > 0
    if $('#line-item-subtotal-'+row_id).text() != ''
      sales_price = parseFloat(sales_price_element.val())
      quantity = parseFloat(quantity_element.val())
      #console.log 'test product sales price ' + sales_price
      #console.log 'test product sales price global ' + get_product_price(row_id)
      #console.log 'test product quantity ' + quantity
      test = quantity*sales_price
      #console.log 'test product subtotal ' + test
      returnval = parseFloat($('#line-item-subtotal-'+row_id).text())
      #console.log 'returning product subtotal ' + returnval
      return returnval
  0.0

racking_line_subtotal = (row_id) ->
  # skip non created subtotals, like row 1 at start up
  #
  #console.log 'racking subtotal element ' + $('#line-item-subtotal-'+row_id).attr('id')
  if $('#racking-line-item-subtotal-'+row_id).length > 0
    if $('#racking-line-item-subtotal-'+row_id).text() != ''

      #console.log 'test racking sales price global ' + get_racking_price(row_id)
      returnval = parseFloat($('#racking-line-item-subtotal-'+row_id).text())
      #console.log 'returning racking subtotal ' + returnval
      return returnval
  0.0


# NOTE - BLANK LINE BELOW NECESSARY
