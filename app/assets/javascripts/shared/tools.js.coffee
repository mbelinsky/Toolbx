$(document).ready ->
	initializeTools = ->
		tools = $('.items > .tool:not(.ready)')

		tools.addClass('ready')
		tools.on 'click', '.add-tool .add, .add-tool .remove', (e) ->
			e.preventDefault();
			el = $(e.currentTarget).parent()

			el.addClass('loading')

		tools.on 'ajax:success', (e) ->
			el = $(e.target).parent()

			el.removeClass('loading')
			if el.hasClass 'add'
				el.removeClass('add').addClass('remove')
			else
				el.removeClass('remove').addClass('add')

		tools.on 'ajax:error', (e) ->
			el = $(e.target).parent()

			el.removeClass('loading')

			alert 'There was a problem, please try again later.'

	initializeTools()