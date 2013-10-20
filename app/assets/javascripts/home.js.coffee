# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  if $(".alert.alert-success").html() isnt ""
    $(".alert.alert-success").show()
    setTimeout (->
      $(".alert.alert-success").hide()
    ), 1000
  else
    $(".alert.alert-success").hide()

  window.location.hash = ""  if window.location.hash and window.location.hash is "#_=_"