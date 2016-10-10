# is_discount_eligible.coffee

####################################################################
# loop through line items and detect
# (1) if total sales >= $5000
# (2) line items not in product category 'Solar Modules' >= .333
# Return true/false
is_discount_eligible = () ->
  solar_total = solar_total_calculation()
  non_solar_total = non_solar_total_calculation()
  total = total_calculation()
  #console.log 'solar_total '+ solar_total
  #console.log 'non_solar_total '+non_solar_total
  #console.log 'total '+total
  if solar_total > 0
    if non_solar_total/total >= .333
      return true
    else
      return false
  else
    return false

# NOTE - BLANK LINE BELOW NECESSARY
