if $('html').is '.admin.users'
  $(document).ready ->

    $('.toggleApptivist').bind 'ajax:success', (data) ->
      console.log data
      $user = $(this).parent()

      if $user.is '.is-apptivist'
        $user.removeClass 'is-apptivist'
      else
        $user.addClass 'is-apptivist'
