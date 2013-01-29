if $('html').is('.admin.tools.index')
	$(document).ready ->
		toolsPath = location.pathname.match(/\/admin\/tools\/page\/([0-9]+)/)
		supportsPushState = !!(window.history && history.pushState)
		currentPageNumber = if toolsPath then parseInt(toolsPath[1], 10) else 1

		$('.items').infinitescroll
			navSelector: '.pagination'
			nextSelector: '.pagination .next a'
			itemSelector: '.items > li:not(.link)'
			loading:
				selector: '#infinite-indicator'
				img: '/assets/loading.gif'
				msgText: '<span>Loading</span>'
				finishedMsg: '<span class="done">All Loaded</span>'
				speed: 0
			state:
				currPage: currentPageNumber
			pathParse: (path, nextPage) ->
				re = new RegExp("^(/admin/tools/(page/)?)#{nextPage}(.*?$)")
				tmpPath = path.match(re)
				path = [tmpPath[1], tmpPath[3]]
				console.log path
				return path
		, (newElements, inf) ->
			window.initializeTools()

			if supportsPushState
				history.replaceState null, null, "/admin/tools/page/#{inf.state.currPage}#{window.location.search}"