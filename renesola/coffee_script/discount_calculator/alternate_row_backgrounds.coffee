
# alternate_row_backgrounds.coffee
alternate_backgrounds = () ->

  current_row = 0
  $.each $('div.discount-line-item-row'), ->

    if is_odd(current_row)
      $('#'+@id).removeClass('row-even')
      $('#'+@id).addClass('row-odd')
    else
      $('#'+@id).removeClass('row-odd')
      $('#'+@id).addClass('row-even')
    current_row = current_row + 1


  $.each $('div.racking-line-item-row'), ->
    if is_odd(current_row)
      $('#'+@id).removeClass('row-even')
      $('#'+@id).addClass('row-odd')
    else
      $('#'+@id).removeClass('row-odd')
      $('#'+@id).addClass('row-even')
    current_row = current_row + 1

  return
####################################################################

# NOTE - BLANK LINE BELOW NECESSARY

