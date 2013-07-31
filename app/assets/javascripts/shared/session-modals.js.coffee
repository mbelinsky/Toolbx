$(document).ready ->
  $('.log-in-trigger').fancybox
    type: 'inline'
    href: '#log-in-modal'
    padding: 0

  $('.sign-up-trigger').fancybox
    type: 'inline'
    href: '#sign-up-modal'
    padding: 0

  $(window).on 'resize', ->
    $.fancybox.update()