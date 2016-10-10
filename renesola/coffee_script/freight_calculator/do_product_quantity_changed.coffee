# do_product_price_or_quantity_changed.coffee

do_product_quantity_changed = (e) ->
  selection_list_id =  e.target.id
  substr = selection_list_id.split("-")
  row_id = substr[2] # row id
  #console.log "do_product_price_or_quantity_changed row "+row_id
  input_type = substr[1] # quantity or price
  #
  # guard for invalid prices and quantities
  if input_type == 'quantity'
    quantity = $('#product-quantity-'+row_id).val()
    if IsInteger(quantity) == false and quantity != ''
      alert 'Please enter a whole number quantity'
      $('#product-quantity-'+row_id).val('')
      $('#product-quantity-'+row_id).focus()
      return
    if IsPositive(quantity) == false and quantity != ''
      alert 'Please enter a positive quantity'
      $('#product-quantity-'+row_id).val('')
      $('#product-quantity-'+row_id).focus()
      return

  if $('#product-quantity-'+row_id).val() != ''
    # read hidden elements off dom
    #cat = row_category(row_id)
    #prod = row_product(row_id)
    #
    # get product dictionary object from first data.coffee
    #
    #current_product = get_current_product_id(cat, prod)
    #data = get_category_product_prices(current_product)


    #
    # Gather Elements needed ahead
    #
    quantity_element = $('#product-quantity-'+row_id)



    #

    quantity = parseFloat(quantity_element.val())
    console.log 'setting quantity to ' + quantity
    ProductPackagingSets[row_id].quantity = quantity
    console.log ProductPackagingSets

    ###############################
    #
    # fill in results
    #
    #console.log 'eligibility = ' + is_discount_eligible()
    #console.log 'discount = ' + calculate_discount()



    #display_discount()




# NOTE - BLANK LINE BELOW NECESSARY
