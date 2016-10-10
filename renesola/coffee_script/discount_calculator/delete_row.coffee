# delete_row.coffee

####################################################################
# deletes line item row by element id
#
delete_row = (row_id) ->
  if $("div#product-line-item-row-"+row_id).length
    $("div#product-line-item-row-"+row_id).remove()

# NOTE - BLANK LINE BELOW NECESSARY
