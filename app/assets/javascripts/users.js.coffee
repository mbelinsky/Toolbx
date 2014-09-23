# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

if $('html').is '.users'

  $(document).ready ->

    $('#emailApptivist').on 'click', ->
      $this = $(this)
      mixpanel.track "Clicked Apptivist Inquirt", { "From": $this.data('from'), "To": $this.data('to') }
