# client-side JavaScript
# run by the browser each time your view template is loaded
# This is compiled by express browserify middleware

$ ->
  console.log('hello world :o')
  
  $.get '/dreams', (dreams) ->
    dreams.forEach (dream) ->
      $('<li></li>').text(dream).appendTo('ul#dreams')

  $('form').submit (event) ->
    event.preventDefault()
    dream = $('input').val()
    $.post '/dreams?' + $.param({dream: dream}), ->
      $('<li></li>').text(dream).appendTo('ul#dreams')
      $('input').val('')
      $('input').focus()
