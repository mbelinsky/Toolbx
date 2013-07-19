$(document).ready ->
  userNav = $('#user-nav')
  userNavTrigger = $('#user-nav-trigger')

  unless userNav.length then return

  userNavTrigger.on 'click', (e) ->
    e.stopPropagation();
    e.preventDefault();

    userNavTrigger.toggleClass('user-nav-open')
    userNav.toggle()

  userNav.bind 'clickoutside', ->
    userNav.hide()