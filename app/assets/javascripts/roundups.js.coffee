# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $roundups = $('#sortableRoundups')
  if $roundups
    $roundups.sortable
      update: ->
        $this = $(this)
        $.post( $this.data('sort-url'), $this.sortable('serialize') )
