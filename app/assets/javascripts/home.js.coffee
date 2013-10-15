# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  unless $(".alert.alert-success").html() is ""
    $(".alert.alert-success").attr "hidden", false
    setTimeout (->
      $(".alert.alert-success").attr "hidden", true
    ), 1000
  else
    $(".alert.alert-success").attr "hidden", true