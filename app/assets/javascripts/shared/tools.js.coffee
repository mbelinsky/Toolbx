window.initializeTools = ->
	tools = $('li.tool:not(.ready)')

	tools.addClass('ready')
	tools.on 'click', '.add-tool .add, .add-tool .remove', (e) ->
		e.preventDefault();
		el = $(e.currentTarget).parent()

		el.addClass('loading')

	tools.on 'ajax:success', (e) ->
		el = $(e.target).parent()
		countEl = el.find('.users-count')
		count = parseInt countEl.text(), 10

		el.removeClass('loading')

		if el.hasClass 'add'
			# Just created a UserTool
			el.removeClass('add').addClass('remove')
			countEl.text count + 1
		else
			# Just destroyed a UserTool
			el.removeClass('remove').addClass('add')
			countEl.text count - 1

	tools.on 'ajax:error', (e) ->
		el = $(e.target).parent()

		el.removeClass('loading')

		alert 'There was a problem, please try again later.'

$(document).ready ->
	window.initializeTools()