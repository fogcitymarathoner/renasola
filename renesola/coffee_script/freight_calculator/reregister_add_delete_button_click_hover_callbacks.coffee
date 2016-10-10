

# reregister_add_delete_button_click_callbacks.coffee
# depends on register_add_delete_button_callbacks.coffee
reregister_add_delete_button_click_callbacks = () ->
  #
  # add callbacks for add and delete buttons
  #
  $("span.add-line-item-button").unbind( "click" );
    # REGISTERING CALLBACK
  $('span.add-line-item-button').click ->
    add_row_callback(this.id)
    return
  # REGISTERING CALLBACK
  $("span.delete-line-item-button").unbind( "click" );
  $('span.delete-line-item-button').click ->
    delete_row_callback(this.id)
    return
  $("span.delete-racking-line-item-button").unbind( "click" );
  $('span.delete-racking-line-item-button').click ->
    delete_racking_row_callback(this.id)
    return
  $('span.first').hover (->
    $(this).removeClass('plus-button')
    $(this).addClass('plus-button-hover')
    return
  ), ->
    $(this).removeClass('plus-button-hover')
    $(this).addClass('plus-button')
    return
  $('span.not-first').hover (->
    $(this).removeClass('minus-button')
    $(this).addClass('minus-button-hover')
    return
  ), ->
    $(this).removeClass('minus-button-hover')
    $(this).addClass('minus-button')
    return


  alternate_backgrounds()