#
# get_guiden_price_fill_in_itemline.coffee
#
get_guiden_price_fill_in_itemline = (product_id, row_id) ->
  #
  # get guiden price and fill in defaults
  #
  url = products_prices_url+product_id+format
  $.get url, (data) ->

    fill_in_product_item_row_default_data(data, row_id)
    set_category_product_prices(data)
    display_discount()


# NOTE - BLANK LINE BELOW NECESSARY
