# do_product_price_or_quantity_changed.coffee

do_product_price_or_quantity_changed = (e) ->
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
  if input_type == 'price'
    sales_price = $('#sales-price-'+row_id).val()
    if IsNumeric(sales_price) == false and sales_price != ''
      alert 'Please enter a numeric sales price'
      $('#sales-price-'+row_id).val('')
      $('#sales-price-'+row_id).focus()
      return
    if IsPositive(sales_price) == false and sales_price != ''
      alert 'Please enter a positive sales price'
      $('#sales-price-'+row_id).val('')
      $('#sales-price-'+row_id).focus()
      return

  if $('#product-quantity-'+row_id).val() != ''
    # read hidden elements off dom
    cat = row_category(row_id)
    prod = row_product(row_id)
    #
    # get product dictionary object from first data.coffee
    #
    current_product = get_current_product_id(cat, prod)
    data = get_category_product_prices(current_product)


    #
    # Gather Elements needed ahead
    #
    quantity_element = $('#product-quantity-'+row_id)
    guiden_price_element = $('#line-item-guiden-price-'+row_id)
    sales_price_element = $('#sales-price-'+row_id)
    subtotal_element = $('#line-item-subtotal-'+row_id)
    message_element = $('#line-item-discount-message-'+row_id)
    # Fill in line_price (sales price x quantity
    #
    # if input changed is price use price off dom to calculate subtotal
    if input_type == 'price'
      #
      # recalculate subtotal
      #
      # don't reset guiden price
      #
      price = parseFloat(sales_price_element.val())
      quantity = parseFloat(quantity_element.val())

      total = price * quantity
      subtotal_element.html solar_module_subtotal(data, quantity, sales_price_element, 0)
      set_message(sales_price_element, guiden_price_element, message_element)
    else
      # else quantity has been changed calculate subtotal with sales price straight off of a get lookup

      # the price update from above at calculate_guiden_price is visible but not available for calculation
      validate_price_do_line_calculations_product(current_product, parseInt(quantity, 10),
                        guiden_price_element,
                        sales_price_element,
                        subtotal_element,
                        row_id
      )

    ###############################
    #
    # fill in results
    #
    #console.log 'eligibility = ' + is_discount_eligible()
    #console.log 'discount = ' + calculate_discount()



    display_discount()




# NOTE - BLANK LINE BELOW NECESSARY
