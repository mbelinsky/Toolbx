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
				mixpanel.track('Added Article', {'Article Title': article.find('h1').text()})
				el.removeClass('add').addClass('remove')
			else
				# Just destroyed a UserArticle
				mixpanel.track('Removed Article', {'Article Title': article.find('h1').text()})
				el.removeClass('remove').addClass('add')

		article.on 'ajax:error', (e, xhr) ->
			el = $(e.target).parent()
			el.removeClass('loading')

			if xhr.status == 403
				alert 'You\'re not allowed to do that yet.'
			else
				alert 'There was a problem, please try again later.'