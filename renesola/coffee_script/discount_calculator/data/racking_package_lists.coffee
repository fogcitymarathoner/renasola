# racking_package_lists.coffee
# depends on categories.coffee
####################################################################
X10 = []
X100 = []
X1000 = []
# build X10
for c in CategoryList
  for p in c['products']

    if c['description'].match(/[S][o][l][a][r][ ][R][a][c][k][i][n][g][ ][S][y][s][t][e][m]/)

      url = products_prices_url+p.id+format
      if p['description'].match(/XR-10-/)

        $.get url, (data) ->
          X10.push data
      if p['description'].match(/XR-100-/)
        $.get url, (data) ->
          X100.push data
      if p['description'].match(/XR-1000-/)
        $.get url, (data) ->
          X1000.push data


# NOTE - BLANK LINE BELOW NECESSARY

find_racking_prices_by_id = (current_product) ->

  selected_system = $('input:radio[name=racking-choice]:checked').val()
  # XR 10 selected
  if selected_system == 'r1'

    for p in X10
      #console.log p
      #console.log ' passed row_id type ' + typeof row_id
      #console.log p.row_id+ ' stored row_id type ' + typeof p.row_id
      #console.log p.price
      #console.log 'comparing input p.id ' + p.id + ' with stored ' + current_product
      if p.id == current_product
        #console.log 'returning sales price ' + p
        return p
  # XR 100 selected
  if selected_system == 'r2'
    for p in X100
      #console.log p
      #console.log ' passed row_id type ' + typeof row_id
      #console.log p.row_id+ ' stored row_id type ' + typeof p.row_id
      #console.log p.price
      #console.log 'comparing input p.id ' + p.id + ' with stored ' + current_product
      if p.id == current_product
        #console.log 'returning sales price ' + p
        return p
  # XR 1000 selected
  if selected_system == 'r3'
    for p in X1000
      #console.log p
      #console.log ' passed row_id type ' + typeof row_id
      #console.log p.row_id+ ' stored row_id type ' + typeof p.row_id
      #console.log p.price
      #console.log 'comparing input p.id ' + p.id + ' with stored ' + current_product
      if p.id == current_product
        #console.log 'returning sales price ' + p
        return p
# NOTE - BLANK LINE BELOW NECESSARY


