# do_racking_price_or_quantity_changed.coffee

do_racking_price_or_quantity_changed = (e) ->
  selection_list_id =  e.target.id
  #console.log 'q or s element changed - ' + selection_list_id
  substr = selection_list_id.split("-")
  row_id = substr[2] # row id

  #console.log "row "+row_id

  input_type = substr[1] # quantity or price
  #
  # guard for invalid prices and quantities
  if input_type == 'quantity'
    quantity = $('#racking-quantity-'+row_id).val()
    #console.log 'quantity - ' + quantity
    if IsNumeric(quantity) == false and quantity != ''
      alert 'please enter a numeric racking quantity'
      $('#racking-quantity-'+row_id).val('')
      $('#racking-quantity-'+row_id).focus()
      return
    if IsPositive(quantity) == false and quantity != ''
      alert 'please enter a positive racking quantity'
      $('#racking-quantity-'+row_id).val('')
      $('#racking-quantity-'+row_id).focus()
      return
  if input_type == 'price'
    sales_price = $('#racking-price-'+row_id).val()
    if IsNumeric(sales_price) == false and sales_price != ''
      alert 'please enter a numeric racking sales price'
      $('#racking-price-'+row_id).val('')
      $('#racking-price-'+row_id).focus()
      return
    if IsPositive(sales_price) == false and sales_price != ''
      alert 'please enter a positive racking sales price'
      $('#racking-price-'+row_id).val('')
      $('#racking-price-'+row_id).focus()
      return

  if $('#racking-quantity-'+row_id).val() != ''
    # read hidden elements off dom
    racking_cat = row_racking_category(row_id)
    racking_prod = row_racking_product(row_id)
    #
    # get product dictionary object from first data.coffee
    #
    #console.log 'racking:looking up product id for cat - ' + racking_cat + 'prod = ' + racking_prod
    current_product = get_current_product_id(racking_cat, racking_prod)
    #console.log 'RACKING: current product - ' + current_product
    #
    # Gather Elements needed ahead
    #
    quantity_element = $('#racking-quantity-'+row_id)
    guiden_price_element = $('#racking-line-item-guiden-price-'+row_id)
    sales_price_element = $('#racking-price-'+row_id)
    subtotal_element = $('#racking-line-item-subtotal-'+row_id)
    message_element = $('#racking-line-item-discount-message-'+row_id)
    #console.log 'guiden element before message setter - ' + guiden_price_element.attr('id')
    #console.log 'message element before message setter - ' + message_element.attr('id')
    # Fill in line_price (sales price x quantity
    #
    # if input changed is price use price off dom to calculate subtotal
    if input_type == 'price'
      #
      # recalculate subtotal
      #
      # don't reset guiden price
      #
      #console.log 'catching price change'
      price = parseFloat(sales_price_element.val())
      quantity = parseFloat(quantity_element.val())
      #console.log 'price ' + price + 'quantity ' + quantity
      total = price * quantity
      #console.log 'new total - ' + total
      subtotal_element.html total.toFixed(2)
      set_message(sales_price_element, guiden_price_element, message_element)
    else
      # else quantity has been changed calculate subtotal with sales price straight off of a get lookup
      # the price update from above at calculate_guiden_price is visible but not available for calculation
            # the price update from above at calculate_guiden_price is visible but not available for calculation
      validate_price_do_line_calculations_racking(current_product, parseInt(quantity, 10),
                        guiden_price_element,
                        sales_price_element,
                        subtotal_element,
                        row_id
      )


    ###############################
    #
    # fill in results
    #

    display_discount()




# NOTE - BLANK LINE BELOW NECESSARY
