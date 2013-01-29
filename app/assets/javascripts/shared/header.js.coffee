$(document).ready ->
	header = $('#top')

	$('#header-nav-trigger').on 'click', (e) ->
		e.preventDefault()
		header.toggleClass('nav-open')