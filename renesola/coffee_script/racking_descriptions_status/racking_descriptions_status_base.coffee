

get_status_fill_in_page = () ->
  #
  # get guiden price and fill in defaults
  #


  $.getJSON racking_upload_status_url, (data) ->
    payload = JSON.parse(data)
    console.log payload['message']
    console.log payload['upload_date']
    $('#date').html payload['upload_date']
    $('#message').html payload['message']

setInterval (->
  get_status_fill_in_page()
  return
), 3000


