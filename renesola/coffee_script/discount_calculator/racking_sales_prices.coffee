#
# product_sales_prices.coffee
#
# for setting and retrieving product prices
#

#
# racking_sales_prices.coffee
#
# for setting and retrieving racking prices
#

RackingSalesPrices = []


racking_price_row_count = (row_id) ->
  count = 0

  for p in RackingSalesPrices
    if p.row_id == row_id.toString()
      count = 1
      return count
  return count


set_racking_price = (row_id, price) ->
  #console.log 'setting racking price'
  price_obj = {
    'row_id': row_id,
    'price': price
  }
  row_id_count = racking_price_row_count(row_id)
  #console.log 'row id count - ' + row_id_count
  if row_id_count == 0
    RackingSalesPrices.push(price_obj)
  else
    index = 0
    for p in RackingSalesPrices
      if p.row_id == row_id.toString()
        # Changes item in list???
        #console.log 'replacing index ' + index + ' of RackingSalesPrices'
        RackingSalesPrices[index] = price_obj
        break
      index = index + 1



get_racking_price = (row_id) ->
  #console.log 'in get_racking_price'
  for p in RackingSalesPrices
    #console.log p
    #console.log ' passed row_id type ' + typeof row_id
    #console.log p.row_id+ ' stored row_id type ' + typeof p.row_id
    #console.log p.price
    #console.log 'comparing input row_id ' + row_id + ' with stored ' + p.row_id
    if p.row_id == row_id.toString()
      #console.log 'returning sales price ' + p.price
      return p.price



# NOTE - BLANK LINE BELOW NECESSARY

