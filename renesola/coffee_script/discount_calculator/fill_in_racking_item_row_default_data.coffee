#
# fill_in_row_default_data.coffee


fill_in_racking_item_row_default_data = (data, row_id) ->
    # keep in sync with fill_in_racking_item_row_default_data
    prices = data.prices
    number_of_prices =  prices.length
    first_break = data.prices[0]['price_break_quantity']
    first_price = data.prices[0]['price']

    $('#racking-price-'+row_id).val first_price

    set_racking_price(row_id, first_price)
    $('#racking-quantity-'+row_id).val 1
    $('#racking-line-item-guiden-price-'+row_id).html first_price
    $('#racking-line-item-discount-message-'+row_id).html DISCOUNT_WITHIN
    $('#racking-line-item-discount-message-'+row_id).addClass "green-text"
    $('#racking-line-item-subtotal-'+row_id).html ((parseFloat(first_price).toFixed(2) * 100) / 100).toFixed(2)
    # REGISTERING CALLBACK
    $('.racking-line-item-input').unbind('change')
    $('.racking-line-item-input').change do_racking_price_or_quantity_changed



# NOTE - BLANK LINE BELOW NECESSARY
