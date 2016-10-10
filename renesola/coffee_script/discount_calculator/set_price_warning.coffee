
#
# calculate_95_percent_price_warning.coffee
# Depends on urls.coffee

set_message = (sales_price_element, guiden_price_element, message_element) ->
  #
  # set discount message using guiden price off the dom
  # reusing dom values because it's a price change
  #

  #console.log 'guiden element in message setter - ' + guiden_price_element.attr('id')
  #console.log 'message element in message setter - ' + message_element.attr('id')
  guiden_price = parseFloat(guiden_price_element.text())
  #console.log 'guiden price ' + guiden_price
  threshold = (GUIDEDN_THRESHOLD * guiden_price)
  #console.log 'threshold ' + threshold
  price = parseFloat(sales_price_element.val())
  if price > threshold
    #console.log 'price ' + price + 'is ABOVE threshold of ' + threshold
    set_message_within(message_element)
  else
    #console.log 'price ' + price + 'is BELOW threshold of ' + threshold
    set_message_below(message_element)

# NOTE - BLANK LINE BELOW NECESSARY
