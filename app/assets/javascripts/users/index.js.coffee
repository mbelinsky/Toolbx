if $('html').is '.users.index'

  $(document).ready ->

    setActive = ->
      active = $('[data-active]').data("active")
      $('#filterForm').find("[val=#{active}]").addClass("asd")

    $('.strike select').on 'change', ->
      $('#filterForm').submit()
