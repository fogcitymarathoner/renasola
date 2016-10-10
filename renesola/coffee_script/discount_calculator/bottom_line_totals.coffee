#
# bottom_line_totals.coffee
total_product_items = () ->
  total = 0.0
  $("div.discount-line-item-row").each ->
    substr = $(this).attr('id').split("-")

    row_id = parseInt(substr[4]) # row id
    subtotal_line = product_line_subtotal(row_id)
    #console.log 'adding product subtotal to total ' + subtotal_line
    total = total + subtotal_line
  total
total_rack_items = () ->
  total = 0.0
  $("div.racking-line-item-row").each ->
    substr = $(this).attr('id').split("-")

    row_id = parseInt(substr[4]) # row id
    subtotal_line = racking_line_subtotal(row_id)
    #console.log 'adding racking subtotal to total ' + subtotal_line
    total = total + subtotal_line
  total
total_calculation = () ->
  total = 0.0
  # add items subtotals to total
  product_items_total = total_product_items()
  total = total + product_items_total
  # add racking items to the total
  rack_items_total = total_rack_items()
  total = total + rack_items_total

  return total
# non_solar

non_solar_total_calculation = () ->
  non_solar_total = 0.0
  $("div.discount-line-item-row").each ->
    substr = $(this).attr('id').split("-")

    row_id = parseInt(substr[4]) # row id
    # read hidden selected product to get category
    cat = row_category(row_id)
    if cat != 'Solar Modules'
      non_solar_total = non_solar_total + product_line_subtotal(row_id)
  non_solar_total = non_solar_total + total_rack_items()
  return non_solar_total

# solar

solar_total_calculation = () ->
  solar_total = 0.0
  $("div.discount-line-item-row").each ->
    substr = $(this).attr('id').split("-")

    row_id = parseInt(substr[4]) # row id
    # read hidden selected product to get category
    cat = row_category(row_id)
    if cat == 'Solar Modules'
      solar_total = solar_total + product_line_subtotal(row_id)
  return solar_total

# NOTE - BLANK LINE BELOW NECESSARY





