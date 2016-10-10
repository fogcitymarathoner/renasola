# get_next_row.coffee

####################################################################
# returns good id value for discount-line-item-row
# based on highest current row_id
get_next_product_row = () ->
  max = 0
  $("div.discount-line-item-row").each ->
    substr = $(this).attr('id').split("-")

    row_id = parseInt(substr[4]) # row id
    if row_id > max
      max = row_id
  next_id = max + 1

  next_id

# NOTE - BLANK LINE BELOW NECESSARY
