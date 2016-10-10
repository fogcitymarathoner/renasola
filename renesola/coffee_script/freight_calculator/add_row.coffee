# add_row.coffee

####################################################################
add_row = (first) ->

  row_id = get_next_product_row() # start with one item row at load
  #
  # render the line's layout and append
  #
  compiled = _.template(product_line_layout_tpl)
  rendered =  compiled
      row: row_id
      static_url: settings['static_url']
      first: first

  $('#freight-items').append(rendered)
  #
  # render the first part of the product line (search columns[s])
  # and insert into classifications slot made within layout above
  #
  compiled = _.template(_classification_column_tpl)
  rendered =  compiled
      row: row_id

  $("#classifications-"+row_id).html(rendered)
  #
  # Register call backs for category dropdown
  # BOTH DROPDOWNS SHARE THE SAME CALLBACK FUNCTION
  #
  $('#autocomplete-input-category-'+row_id).bind 'input', ->
    window.checkModelData this
    return


  reregister_add_delete_button_click_callbacks()

# NOTE - BLANK LINE BELOW NECESSARY
