window.initializeArticles = ->
	articles = $('li.article:not(.ready)')

	articles.addClass('ready')
	articles.on 'click', '.add-article .add, .add-article .remove', (e) ->
		e.preventDefault();
		el = $(e.currentTarget).parent()

		el.addClass('loading')

	articles.on 'ajax:success', (e) ->
		el = $(e.target).parent()
		countEl = el.find('.users-count')
		count = parseInt countEl.text(), 10

		el.removeClass('loading')

		if el.hasClass 'add'
			# Just created a UserArticle
			mixpanel.track('Added Article', {'Article Title': el.closest('.article').find('h3 a').text()})
			el.removeClass('add').addClass('remove')
			countEl.text count + 1
		else
			# Just destroyed a UserArticle
			mixpanel.track('Removed Article', {'Article Title': el.closest('.article').find('h3 a').text()})
			el.removeClass('remove').addClass('add')
			countEl.text count - 1

	articles.on 'ajax:error', (e, xhr) ->
		el = $(e.target).parent()

		el.removeClass('loading')

		if xhr.status == 403
			alert 'You\'re not allowed to do that yet.'
		else
			alert 'There was a problem, please try again later.'

$(document).ready ->
	window.initializeArticles()