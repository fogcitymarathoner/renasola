#
# fill_in_row_default_data.coffee


fill_in_product_item_row_default_data = (data, row_id) ->
    # keep in sync with fill_in_product_item_row_default_data

    category_description = get_current_product_category_description_from_product_description(data['description'])
    product_description = data['description']

    prices = data.prices
    number_of_prices =  prices.length
    first_break = data.prices[0]['price_break_quantity']
    first_price = data.prices[0]['price']
    #################################################
    #
    # Setting product sales Price
    $('#sales-price-'+row_id).val first_price
    set_product_price(row_id, first_price)
    #
    # End setting product price
    #
    #################################################

    $('#product-quantity-'+row_id).val 1
    $('#line-item-guiden-price-'+row_id).html first_price
    $('#line-item-discount-message-'+row_id).html DISCOUNT_WITHIN
    $('#line-item-discount-message-'+row_id).addClass "green-text"
    if is_solar_module_product_description(product_description)
      $('#line-item-subtotal-'+row_id).html (Math.round((Math.round(after_wattage_price(data, 0) * 1000) / 1000).toFixed(3) * 100) / 100).toFixed(2)
    else
      $('#line-item-subtotal-'+row_id).html (((parseFloat(first_price).toFixed(2) * 100) / 100).toFixed(2))

    # REGISTERING CALLBACK
    $('.discount-calculator-input').unbind('change')
    $('.discount-calculator-input').change do_product_price_or_quantity_changed



# NOTE - BLANK LINE BELOW NECESSARY
