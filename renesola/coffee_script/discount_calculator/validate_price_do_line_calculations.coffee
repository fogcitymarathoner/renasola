#
# lookup_calculate_guiden_price.coffee
# Depends on urls.coffee
validate_price_do_line_calculations_product = (current_product, quantity,
                          guiden_price_element,
                          sales_price_element,
                          subtotal_element,
                          row_id) ->
  category_description = get_current_product_category_description_from_product_id(current_product)
  data = get_category_product_prices(current_product)
  prices = data.prices
  if number_of_breaks(prices) == 4
    console.log '4 price breaks'
    if quantity <= break_one(prices)
      console.log 'within price break one'
      adjusted_price = price_break_one(prices)

      set_guiden_price(row_id, adjusted_price, guiden_price_element, sales_price_element)
      if is_solar_module_product_id(current_product)
        subtotal_element.html solar_module_subtotal(data, quantity, sales_price_element,  0)
      else
        subtotal_element.html non_solar_module_subtotal(sales_price_element, quantity)
    else if quantity > break_one(prices) and quantity < break_two(prices)
      console.log 'within price break two'
      adjusted_price = price_break_two(prices)

      set_guiden_price(row_id, adjusted_price, guiden_price_element, sales_price_element)
      if is_solar_module_product_id(current_product)
        subtotal_element.html solar_module_subtotal(data, quantity, sales_price_element,  1)
      else
        subtotal_element.html non_solar_module_subtotal(sales_price_element, quantity)
    else if quantity >= break_two(prices) and quantity <= break_three(prices)
      console.log 'within price break three'
      adjusted_price = price_break_three(prices)

      set_guiden_price(row_id, adjusted_price, guiden_price_element, sales_price_element)
      if is_solar_module_product_id(current_product)
        subtotal_element.html solar_module_subtotal(data, quantity, sales_price_element,  2)
      else
        subtotal_element.html non_solar_module_subtotal(sales_price_element, quantity)
    else
      console.log 'in price break four'
      adjusted_price = price_break_four(prices)

      set_guiden_price(row_id, adjusted_price, guiden_price_element, sales_price_element)
      if is_solar_module_product_id(current_product)
        subtotal_element.html solar_module_subtotal(data, quantity, sales_price_element,  3)
      else
        subtotal_element.html non_solar_module_subtotal(sales_price_element, quantity)
  else if number_of_breaks(prices) == 3
    console.log '3 price breaks'
    if quantity <= break_one(prices)
      console.log 'within price break one'
      adjusted_price = price_break_one(prices)

      set_guiden_price(row_id, adjusted_price, guiden_price_element, sales_price_element)
      if is_solar_module_product_id(current_product)
        subtotal_element.html solar_module_subtotal(data, quantity, sales_price_element,  0)
      else
        subtotal_element.html non_solar_module_subtotal(sales_price_element, quantity)
    if quantity > break_one(prices) and quantity <= break_two(prices)
      console.log 'within price break two'
      adjusted_price = price_break_two(prices)

      set_guiden_price(row_id, adjusted_price, guiden_price_element, sales_price_element)
      if is_solar_module_product_id(current_product)
        subtotal_element.html solar_module_subtotal(data, quantity, sales_price_element,  1)
      else
        subtotal_element.html non_solar_module_subtotal(sales_price_element, quantity)
    else
      console.log 'in price break three'
      adjusted_price = price_break_three(prices)

      set_guiden_price(row_id, adjusted_price, guiden_price_element, sales_price_element)
      if is_solar_module_product_id(current_product)
        subtotal_element.html solar_module_subtotal(data, quantity, sales_price_element,  2)
      else
        subtotal_element.html non_solar_module_subtotal(sales_price_element, quantity)
  else if number_of_breaks(prices) == 2
    console.log '2 price breaks'
    if quantity <= break_one(prices)
      adjusted_price = price_break_one(prices)
      console.log ' in first price break'
      set_guiden_price(row_id, adjusted_price, guiden_price_element, sales_price_element)
      if is_solar_module_product_id(current_product)
        subtotal_element.html solar_module_subtotal(data, quantity, sales_price_element,  0)
      else
        subtotal_element.html non_solar_module_subtotal(sales_price_element, quantity)
    else
      adjusted_price = price_break_two(prices)
      set_guiden_price(row_id, adjusted_price, guiden_price_element, sales_price_element)
      if is_solar_module_product_id(current_product)
        subtotal_element.html  solar_module_subtotal(data, quantity, sales_price_element,  1)
      else
        subtotal_element.html non_solar_module_subtotal(sales_price_element, quantity)
  else
    console.log '1 price break'
    set_guiden_price(row_id, price_break_one(prices), guiden_price_element, sales_price_element)
    if is_solar_module_product_id(current_product)
      subtotal_element.html solar_module_subtotal(data, quantity, sales_price_element,  0)
    else
      subtotal_element.html non_solar_module_subtotal(sales_price_element, quantity)



validate_price_do_line_calculations_racking = (current_product, quantity,
                          guiden_price_element,
                          sales_price_element,
                          subtotal_element,
                          row_id) ->
  #
  # do lookup for racking in cache
  #
  category_description = get_current_product_category_description_from_product_id(current_product)
  prices = find_racking_prices_by_id(current_product)
  console.log ' number of price breaks - ' + number_of_breaks_racking(prices)
  if number_of_breaks_racking(prices) == 4
    if quantity <= break_one_racking(prices)
      set_guiden_price(row_id, price_break_one_racking(prices), guiden_price_element, sales_price_element)
    else if quantity > break_one_racking(prices) and quantity < break_two_racking(prices)
      set_guiden_price(row_id, price_break_two_racking(prices), guiden_price_element, sales_price_element)
    else if quantity >= break_two_racking(prices) and quantity <= break_three_racking(prices)
      set_guiden_price(row_id, price_break_three_racking(prices), guiden_price_element, sales_price_element)
    else
      set_guiden_price(row_id, price_break_four_racking(prices), guiden_price_element, sales_price_element)
  else if number_of_breaks_racking(prices) == 3
    if quantity <= break_one_racking(prices)
      set_guiden_price(row_id, price_break_one_racking(prices), guiden_price_element, sales_price_element)
    else if quantity > break_one_racking(prices) and quantity <= break_two_racking(prices)
      set_guiden_price(row_id, price_break_two_racking(prices), guiden_price_element, sales_price_element)
    else
      set_guiden_price(row_id, price_break_three_racking(prices), guiden_price_element, sales_price_element)
  else if number_of_breaks_racking(prices) == 2
    console.log ' price break ' + break_one_racking(prices)
    if quantity <= break_one_racking(prices)
      console.log ' below or less than that break'
      set_guiden_price(row_id, price_break_one_racking(prices), guiden_price_element, sales_price_element)
    else
      console.log ' above that break'
      set_guiden_price(row_id, price_break_two_racking(prices), guiden_price_element, sales_price_element)
  else
    console.log ' only one price break ???'
    set_guiden_price(row_id, price_break_one_racking(prices), guiden_price_element, sales_price_element)
  subtotal_element.html (parseFloat(sales_price_element.val()) * quantity).toFixed(2)



# NOTE - BLANK LINE BELOW NECESSARY
