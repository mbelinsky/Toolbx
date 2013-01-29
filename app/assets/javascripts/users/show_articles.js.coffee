if $('html').is '.users.show_articles'
	$(document).ready ->
		username = location.pathname.match(/\/users\/([\w-]+)/)[1]
		articlesPath = location.pathname.match(/\/articles\/page\/([0-9]+)/)
		supportsPushState = !!(window.history && history.pushState)
		currentPageNumber = if articlesPath then parseInt(articlesPath[1], 10) else 1

		$('.items').infinitescroll
			navSelector: '.pagination'
			nextSelector: '.pagination .next a'
			itemSelector: '.items > li'
			loading:
				selector: '#infinite-indicator'
				img: '/assets/loading.gif'
				msgText: '<span>Loading</span>'
				finishedMsg: '<span class="done">All Loaded</span>'
				speed: 0
			state:
				currPage: currentPageNumber
			debug: true
			pathParse: (path, nextPage) ->
				re = new RegExp("^(/users/#{username}/articles/(page/)?)#{nextPage}(.*?$)")
				tmpPath = path.match(re)
				path = [tmpPath[1], tmpPath[3]]
				return path
		, (newElements, inf) ->
			window.initializeArticles()

			if supportsPushState
				history.replaceState null, null, "/users/#{username}/articles/page/#{inf.state.currPage}#{window.location.search}"