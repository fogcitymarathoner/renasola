
#
# calculate_discount_display.coffee

calculate_discount = (total) ->
  if total >= 5000 and total < 10000
    return total*.01
  if total >= 10000 and total < 20000
    return 10000*.01 + (total-10000)*.15
  if total > 20000
    return 10000*.01 + 10000*.015 + (total-20000)*.02
  return 0



display_discount = () ->

  total = total_calculation()
  if is_discount_eligible()
    discount = calculate_discount(total)
  else
    discount = 0.0
  total_after_discount = total - discount
  discount_message = 'Total Given Discount: '+discount.toFixed(2)

  $('#discount-subtotal').html('Subtotal before discount: '+total.toFixed(2))
  $('#discount-subtotal-after-discount').html('Subtotal after discount: '+total_after_discount.toFixed(2))
  $('#discount-total-given-discount').html(discount_message)


# NOTE - BLANK LINE BELOW NECESSARY
