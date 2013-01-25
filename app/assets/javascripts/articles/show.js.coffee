if $('html').is '.articles.show'
	$(document).ready ->
		article = $('article')

		article.on 'click', '.add-remove-container .add, .add-remove-container .remove', (e) ->
			e.preventDefault();
			el = $(e.currentTarget).parent()

			el.addClass('loading')

		article.on 'ajax:success', (e) ->
			el = $(e.target).parent()

			el.removeClass('loading')

			if el.hasClass 'add'
				# Just created a UserArticle
				el.removeClass('add').addClass('remove')
			else
				# Just destroyed a UserArticle
				el.removeClass('remove').addClass('add')

		article.on 'ajax:error', (e) ->
			el = $(e.target).parent()

			el.removeClass('loading')

			alert 'There was a problem, please try again later.'