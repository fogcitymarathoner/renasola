#
# price_breaks.coffee
#
# functions to return informaiton on a products prices
#
# number_of_breaks,
#
# break_onn,
# break_two,
# break_three,
# break_four
#
# price_break_one
# price_break_two
# price_break_three
# price_break_four
#


number_of_breaks = (prices) ->
  return prices.length
number_of_breaks_racking = (prices) ->
  return prices.prices.length

# non Racking
break_one = (prices) ->
	first_break = prices[0]['price_break_quantity']
break_two = (prices) ->
	second_break = prices[1]['price_break_quantity']
break_three = (prices) ->
	third_break = prices[2]['price_break_quantity']
break_four = (prices) ->
	forth_break = prices[3]['price_break_quantity']
# racking
break_one_racking = (prices) ->
	first_break = prices['prices'][0]['price_break_quantity']
break_two_racking = (prices) ->
	second_break = prices['prices'][1]['price_break_quantity']
break_three_racking = (prices) ->
	third_break = prices['prices'][2]['price_break_quantity']
break_four_racking = (prices) ->
	forth_break = prices['prices'][3]['price_break_quantity']
# non Racking

price_break_one = (prices) ->
	first_price = prices[0]['price']
price_break_two = (prices) ->
	second_price = prices[1]['price']
price_break_three = (prices) ->
	third_price = prices[2]['price']
price_break_four = (prices) ->
	forth_price = prices[3]['price']
# Racking
price_break_one_racking = (prices) ->
	first_price = prices['prices'][0]['price']
price_break_two_racking = (prices) ->
	second_price = prices['prices'][1]['price']
price_break_three_racking = (prices) ->
	third_price = prices['prices'][2]['price']
price_break_four_racking = (prices) ->
	forth_price = prices['prices'][3]['price']

# NOTE - BLANK LINE BELOW NECESSARY
