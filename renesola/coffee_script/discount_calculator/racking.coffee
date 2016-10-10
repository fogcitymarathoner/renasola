# racking.coffee
#
#  contains racking functions for adding and removing complete packages from calculator
#

add_racking_product_row = (prod) ->
  #
  #
  # add empty item row for racking item
  #
  compiled = _.template(racking_list_item_tpl)

  row_id = get_next_racking_row()
  rendered =  compiled
    row: row_id
    prod: prod
    static_url: settings['static_url']
  $('#discount-racking-items').append(rendered)


  fill_in_racking_item_row_default_data(prod, row_id)


add_racking_package_x10 = () ->

  for prod in X10
    add_racking_product_row(prod)


add_racking_package_x100 = () ->
  for prod in X100
    add_racking_product_row(prod)

add_racking_package_x1000 = () ->
  for prod in X1000
    add_racking_product_row(prod)

####################################################################
remove_racking_package = () ->

  $("div.racking-line-item-row").each ->

    substr = $(this).attr('id').split("-")

    row_id = parseInt(substr[4]) # row id
    $("div#racking-line-item-row-"+row_id).remove()

  reregister_add_delete_button_click_callbacks()

set_racking_package = () ->
  remove_racking_package()
  selected_system = $('input:radio[name=racking-choice]:checked').val()
  # XR 10 selected
  if selected_system == 'r1'
    add_racking_package_x10()
  # XR 100 selected
  if selected_system == 'r2'
    add_racking_package_x100()
  # XR 1000 selected
  if selected_system == 'r3'
    add_racking_package_x1000()


  ###############################
  # need delay
  #
  # VERIFIED
  #
  setTimeout (->
    display_discount()
    return
  ), 3000

  reregister_add_delete_button_click_callbacks()
# NOTE - BLANK LINE BELOW NECESSARY
