if $('html').is '.home.index'
  $(document).ready ->
    billboard = $('#billboard')
    cta = $('#signup-cta')
    masonryContainer = $('.items.articles')

    # This is kind of hacky, but forces relayout on masonry items for msall screens
    # because featured articles and tools are taller.
    if $(window).width() < 960
      masonryContainer.masonry()

    if cta.length
      ctaOffTop = cta.offset().top

      # Update offset if window size changes (for media query stuff)
      $(window).on 'resize', ->
        ctaOffTop = cta.offset().top
        masonryContainer.masonry()

      $(window).on 'scroll', ->
        if $(document).scrollTop() >= (ctaOffTop - 50)
          cta.addClass 'docked'
          billboard.addClass 'cta-docked'
        else
          cta.removeClass 'docked'
          billboard.removeClass 'cta-docked'

    $('.tooltip').each ->
      width = $(this).outerWidth()
      # - 5px to account for icon padding
      $(this).css {'margin-left': -((width / 2) - 5), 'width': width}


    # Category live Filtering
    $('#atf').on 'click', 'a', (e) ->
      e.preventDefault()

      if $(this).hasClass 'active'
        $('#atf').find('a').removeClass 'active'

        masonryContainer.find('.item').show()
        masonryContainer.masonry()

      else
        $('#atf').find('a').removeClass 'active'
        $(this).addClass 'active'

        category = $(this).data('category')

        masonryContainer.find('.item').show()
        masonryContainer.find(".item:not(.#{category})").hide()
        masonryContainer.masonry()

  $(window).load ->
    # Multiline text overflow
    $('h3').dotdotdot()
