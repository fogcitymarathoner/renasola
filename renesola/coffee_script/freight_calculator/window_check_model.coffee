
# window_check_models.coffee


window.checkModelData = (ele) ->

  element = $(ele)
  #
  # 'name' is the value selected off drops
  #
  name = element.val()
  element_id = element.attr('id')
  console.log element_id
  substr = element_id.split("-")
  row_id = substr[3] # row id
  dropdown_type = substr[2]

  console.log ' doing event for product selection'

  cat = $('#autocomplete-input-category-' + row_id).val()
  substr = cat.split(':')

  cat = substr[0]
  $('#product-quantity-'+row_id).prop('disabled', false)
  $('#product-quantity-'+row_id).val(0)
  console.log 'cat - ' + cat
  for c in Object.keys(CategoryList)
    if CategoryList[c].category == cat
      current_product = CategoryList[c]
      break

  set_product_package_set(current_product, row_id)

# NOTE - BLANK LINE BELOW NECESSARY
