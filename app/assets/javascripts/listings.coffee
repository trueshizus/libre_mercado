# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#listing_tag_list').removeClass('form-control')
  $('#listing_tag_list').selectize
    delimiter: ','
    persist: false
    create: (input) ->
      {
        value: input
        text: input
      }
  return
