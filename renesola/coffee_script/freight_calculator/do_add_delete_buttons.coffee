
###########################################
# do_add_delete_buttons.coffee

add_row_callback = (id) ->
  add_row(false)
delete_row_callback = (id) ->
  substr = id.split("-")

  row_id = parseInt(substr[4]) # row id

  $("#product-line-item-row-"+row_id).remove()

  delete ProductPackagingSets[row_id]

  #display_discount()


# NOTE - BLANK LINE BELOW NECESSARY



