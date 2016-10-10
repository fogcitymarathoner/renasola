#
# product_sales_prices.coffee
#
# for setting and retrieving product prices
#



ProductSalesPrices = []

product_price_row_count = (row_id) ->
  count = 0

  for p in ProductSalesPrices
    if p.row_id == row_id.toString()
      count = 1
      return count
  return count

set_product_price = (row_id, price) ->
  #console.log 'setting product price'
  price_obj = {
    'row_id': row_id,
    'price': price
  }
  row_id_count = product_price_row_count(row_id)
  #console.log 'row id count - ' + row_id_count
  if row_id_count == 0
    ProductSalesPrices.push(price_obj)
  else
    index = 0
    for p in ProductSalesPrices
      if p.row_id == row_id.toString()
        # Changes item in list???
        #console.log 'replacing index ' + index + ' of ProductSalesPrices'
        ProductSalesPrices[index] = price_obj
        break
      index = index + 1


get_product_price = (row_id) ->
  #console.log 'in get_product_price'
  for p in ProductSalesPrices
    #console.log p
    #console.log ' passed row_id type ' + typeof row_id
    #console.log p.row_id+ ' stored row_id type ' + typeof p.row_id
    #console.log p.price
    #console.log 'comparing input row_id ' + row_id + ' with stored ' + p.row_id
    if p.row_id == row_id.toString()
      #console.log 'returning sales price ' + p.price
      return p.price
# NOTE - BLANK LINE BELOW NECESSARY
