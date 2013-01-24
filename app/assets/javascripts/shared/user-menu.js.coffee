$(document).ready ->
	userNav = $('#user-nav')
	userNavTrigger = $('#user-nav-trigger')

	unless userNav.length then return

	userNavTrigger.on 'click', (e) ->
		e.stopPropagation();
		e.preventDefault();

		userNav.toggle()

	userNav.bind 'clickoutside', ->
		userNav.hide()