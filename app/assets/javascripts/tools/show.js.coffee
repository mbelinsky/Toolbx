if $('html').is '.tools.show'
	$(document).ready ->
		tool = $('#tool-container')

		tool.on 'click', '.add-tool .add, .add-tool .remove', (e) ->
			e.preventDefault();
			el = $(e.currentTarget).parent()

			el.addClass('loading')

		tool.on 'ajax:success', (e) ->
			el = $(e.target).parent()
			countEl = el.find('.users-count')
			count = parseInt countEl.text(), 10

			el.removeClass('loading')

			if el.hasClass 'add'
				# Just created a UserTool
				mixpanel.track('Added Tool', {'Tool Name': tool.find('h1').text()})
				el.removeClass('add').addClass('remove')
				countEl.text count + 1
			else
				# Just destroyed a UserTool
				mixpanel.track('Removed Tool', {'Tool Name': tool.find('h1').text()})
				el.removeClass('remove').addClass('add')
				countEl.text count - 1

		tool.on 'ajax:error', (e) ->
			el = $(e.target).parent()

			el.removeClass('loading')

			alert 'There was a problem, please try again later.'

		$('.screens a').fancybox
			padding: 10
			helpers:
				overlay:
					css:
						background: 'rgba(0, 0, 0, 0.8)'