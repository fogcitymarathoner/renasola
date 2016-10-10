
# window_check_models.coffee


window.checkModelData = (ele) ->

  element = $(ele)
  #
  # 'name' is the value selected off drops
  #
  name = element.val()
  element_id = element.attr('id')
  substr = element_id.split("-")
  row_id = substr[3] # row id
  dropdown_type = substr[2]

  if dropdown_type == 'category'
    for cat in CategoryList
      if name == cat['description']
        $("#input-category-hidden-"+row_id).html name
        substr = name.split(':')
        cat = substr[0]
        cat_slug = S(cat).slugify().s

        $("input#autocomplete-input-product-" + row_id).val('') #
        $("#autocomplete-input-product-" + row_id).attr('list', cat_slug)
        break
  else
    #
    # product dropdown response
    #
    cat = $('#autocomplete-input-category-' + row_id).val()
    prod = $('#autocomplete-input-product-' + row_id).val()
    substr = cat.split(':')

    cat = substr[0]
    for prod_searching in CategoryProductSearchList
      combined_cat_prod = cat + ':' + prod
      if combined_cat_prod == prod_searching
        $("#input-product-hidden-"+row_id).html prod

        #
        # render next part of product line, user inputs
        #
#        compiled = _.template(_user_input_quantity_price_tpl)
#        rendered =  compiled
#            row: row_id
#        $('#line-item-inputs-'+row_id).html rendered

        ############################
        # fill in defaults

        current_product = get_current_product_id(cat, prod)
        #
        # get guiden price and fill in defaults
        #
        get_guiden_price_fill_in_itemline(current_product, row_id)



        ############################

        break
# NOTE - BLANK LINE BELOW NECESSARY
