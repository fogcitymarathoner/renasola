

get_status_fill_in_page = () ->
  #
  # get guiden price and fill in defaults
  #


  $.getJSON pricelist_upload_status_url, (data) ->
    payload = JSON.parse(data)
    console.log payload['message']
    products = payload['products']
    console.log products
    console.log data
    if payload.message == 'UPLOAD SUCCESSFUL'
      $("#finished").removeClass('hidden-data')
      $("#in-process").addClass('hidden-data')
      $('#finished-message').html payload['message']
      $('#finished-upload-count').html 'Prossessed '+ (products.length) + ' products.'
      $('#finished-total').html '&nbsp;&nbsp;&nbsp;&nbsp;Out of a total of ' + payload['total_product_count']
      $('#finished-upload-date').html payload['upload_date']
      compiled = _.template(PRODUCTS_TPL)
      rendered = compiled
        products: products
      $('#products').html(rendered)
    else
      $("#finished").addClass('hidden-data')
      $("#in-process").removeClass('hidden-data')
      $('#in-process-message').html payload['message']
      $('#in-process-upload-count').html 'Prossessed '+ (products.length) + ' products.'
      $('#in-process-total').html '&nbsp;&nbsp;&nbsp;&nbsp;Out of a total of ' + payload['total_product_count']
      $('#in-process-upload-date').html payload['upload_date']
      $('div.progress-bar').css('width', (products.length/payload['total_product_count']*100)+'%')
      $('div.progress-bar').html( Math.round((products.length/payload['total_product_count']*100))+'%')
      compiled = _.template(PRODUCTS_TPL)
      rendered = compiled
        products: products
      $('#products').html(rendered)


      $('#products')

    #alert(data.message)


setInterval (->
  get_status_fill_in_page()
  return
), 3000