# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('body').on 'click', '#generatePass', ->
    caracteres = 'abcdefghijkmnpqrtuvwxyzABCDEFGHIJKLMNPQRTUVWXYZ2346789'
    contrasena = ''
    contrasena += caracteres.charAt(Math.floor(Math.random() * caracteres.length)) for i in [0 .. 7]
    $('#user_password').removeAttr('readonly');
    $('#user_password').val(contrasena);
