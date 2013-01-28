if $('html').is '.tools.show'
	$(document).ready ->
		tool = $('#tool-container')

		tool.on 'click', '.add-remove-container .add, .add-remove-container .remove', (e) ->
			e.preventDefault();
			el = $(e.currentTarget).parent()

			el.addClass('loading')

		tool.on 'ajax:success', (e) ->
			el = $(e.target).parent()

			el.removeClass('loading')

			if el.hasClass 'add'
				# Just created a UserArticle
				el.removeClass('add').addClass('remove')
			else
				# Just destroyed a UserArticle
				el.removeClass('remove').addClass('add')

		tool.on 'ajax:error', (e) ->
			el = $(e.target).parent()
			el.removeClass('loading')

			alert 'There was a problem, please try again later.'

		$('.screens a').fancybox()