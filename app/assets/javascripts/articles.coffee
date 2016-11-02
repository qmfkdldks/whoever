# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Like button ajax call.
$(document).on 'turbolinks:load', ->

  $('#like_button').on('ajax:success', (e, data, status, xhr) ->
    number = undefined
    console.log data
    number = data['like_number']
    $('#like_button>i').text ' ' + number
    if data['like']
      $('#like_button>i').addClass 'like'
    else
      $('#like_button>i').removeClass 'like'
  ).on 'ajax:error', (e, xhr, status, error) ->
    $('#like_button').append '<p>ERROR</p>'
