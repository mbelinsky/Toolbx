if $('html').is('.users.show_articles, .users.show_tools, .users.show_features')

  $(document).ready ->

    $('#emailApptivist').on 'click', ->
      $this = $(this)
      mixpanel.track('Apptivist Inquiry Click', {
        'from name': $this.data('from-name'),
        'from email': $this.data('from-email'),
        'to name': $this.data('to-name'),
        'to email': $this.data('to-email')
      })
