if $('html').is '.users.index'

  $(document).ready ->

    setActive = ->
      active = $('[data-active]').data("active")
      $('#filterForm').find("[val=#{active}]").addClass("asd")

    $('.strike select').on 'change', ->
      $('#filterForm').submit()

    usersPath = location.pathname.match(/\/apptivists\/page\/([0-9]+)/)
    supportsPushState = !!(window.history && history.pushState)
    currentPageNumber = if usersPath then parseInt(usersPath[1], 10) else 1

    $('.user-list').infinitescroll
      navSelector: '.pagination'
      nextSelector: '.pagination .next a'
      itemSelector: '.user-list li'
      loading:
        selector: '#infinite-indicator'
        img: '/assets/loading.gif'
        msgText: '<span>Loading</span>'
        finishedMsg: '<span class="done">All Loaded</span>'
        speed: 0
      state:
        currPage: currentPageNumber
      pathParse: (path, nextPage) ->
        re = new RegExp("^(/apptivists/(page/)?)#{nextPage}(.*?$)")
        tmpPath = path.match(re)
        path = [tmpPath[1], tmpPath[3]]
        console.log path
        return path
    , (newElements, inf) ->
      window.initializeTools()

      if supportsPushState
        history.replaceState null, null, "/apptivists/page/#{inf.state.currPage}#{window.location.search}"
