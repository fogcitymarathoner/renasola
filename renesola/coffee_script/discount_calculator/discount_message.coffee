#
# discount_message.coffee
#
#  routines to flip message colors from red to green
set_message_green = (element) ->

  element.removeClass "red-text"
  element.addClass "green-text"

set_message_red = (element) ->

  element.removeClass "green-text"
  element.addClass "red-text"

set_message_within = (element) ->
  #console.log 'setting within on ' + element.attr('id')
  element.html DISCOUNT_WITHIN
  set_message_green(element)

set_message_below = (element) ->

  #console.log 'setting below on ' + element.attr('id')
  element.html DISCOUNT_BELOW
  set_message_red(element)