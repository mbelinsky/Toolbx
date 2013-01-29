if $('html').is('.tools.index:not(.admin)')
	$(document).ready ->
		toolsPath = location.pathname.match(/\/tools\/page\/([0-9]+)/)
		supportsPushState = !!(window.history && history.pushState)
		currentPageNumber = if toolsPath then parseInt(toolsPath[1], 10) else 1

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
			pathParse: (path, nextPage) ->
				re = new RegExp("^(/tools/(page/)?)#{nextPage}(.*?$)")
				tmpPath = path.match(re)
				path = [tmpPath[1], tmpPath[3]]
				console.log path
				return path
		, (newElements, inf) ->
			window.initializeTools()

			if supportsPushState
				history.replaceState null, null, "/tools/page/#{inf.state.currPage}#{window.location.search}"