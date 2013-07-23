$.fn.fancySelect = (opts) ->
  settings = $.extend({
    width: 180
    className: ''
  }, opts)

  isMobile = !!navigator.userAgent.match /Mobile|webOS/i

  return this.each ->
    sel = $(this)

    #some global setup stuff
    sel.wrap '<div class="fancy-select">'
    wrapper = sel.parent()
    wrapper.addClass settings.className

    wrapper.append '<div class="trigger">'
    wrapper.append '<ul class="options">'

    trigger = wrapper.find '.trigger'
    options = wrapper.find '.options'

    #disabled in markup?
    disabled = sel.prop('disabled')
    if disabled
      wrapper.addClass 'disabled'

    updateTriggerText = ->
      trigger.text sel.find(':selected').text()

    #using outside-events (doesn't work with `on` syntax)
    wrapper.bind 'clickoutside', ->
      trigger.trigger 'click' if trigger.hasClass 'open'

    trigger.on 'click', ->
      unless disabled
        trigger.toggleClass 'open'

        if isMobile
          if trigger.hasClass 'open'
            sel.focus()
        else
          options.fadeToggle 120
          sel.focus()

          if trigger.hasClass 'open'
            parent = trigger.parent()
            offParent = parent.offsetParent()

            if (parent.position().top + parent.outerHeight() + 5) > offParent.height() - options.outerHeight()
              options.addClass 'overflowing'
            else
              options.removeClass 'overflowing'

    sel.on 'enable', ->
      sel.prop 'disabled', false
      wrapper.removeClass 'disabled'
      disabled = false
      copyOptionsToList()

    sel.on 'disable', ->
      sel.prop 'disabled', true
      wrapper.addClass 'disabled'
      disabled = true

    sel.on 'change', updateTriggerText

    # keyboard control
    sel.on 'keydown', (e) ->
      w = e.which
      hovered = options.find('.hover')
      hovered.removeClass('hover')

      unless w == 9 then e.preventDefault() # tab

      if w == 9 # tab
        if trigger.hasClass 'open' then trigger.trigger 'click'
      if w in [13, 32] # space, enter
        if hovered.length then hovered.trigger 'click' else trigger.trigger 'click'
      else if trigger.hasClass 'open'
        if w == 38 # up
          if hovered.length && hovered.index() > 0 # move up
            hovered.prev().addClass('hover')
          else # move to bottom
            options.find('li:last-child').addClass('hover')
        else if w == 40 # down
          if hovered.length && hovered.index() < options.find('li').length - 1 # move down
            hovered.next().addClass('hover')
          else # move to top
            options.find('li:first-child').addClass('hover')

        newHovered = options.find('.hover')
        if newHovered.length
          options.scrollTop 0
          options.scrollTop newHovered.position().top - 12


    options.on 'click', 'li', ->
      sel.val $(this).data('value')
      sel.trigger 'change'
      setTimeout ->
        trigger.trigger 'click'
      , 45

    copyOptionsToList = ->
      #snag current options before we add a default one
      selOpts = sel.find 'option'

      #generate list of options for the fancySelect
      sel.find('option').each (i, opt) ->
        opt = $(opt)

        if opt.val()
          wrapper.find('.options').append "<li data-value=\"#{opt.val()}\">#{opt.text()}</li>"

      widthFinder = wrapper.clone()
      $('body').append(widthFinder)
      optWidthFinder = widthFinder.find('.options')
      optWidthFinder.css 'width', 'auto'
      option_width = widthFinder.find('.options').width()
      optWidthFinder.css
        display: 'block'
        padding: '0 12px' #TODO this is really static and bad
      optWidth = optWidthFinder.outerWidth()
      options.css 'width', optWidth
      widthFinder.remove()

      # Match the select box width
      if sel.attr('data-width')
        if sel.attr('data-width') > option_width
          options.css('width', sel.attr('data-width'))

      wrapper.css 'width', sel.data('width') || settings.width

      #update our trigger to reflect the select (it really already should, this is just a safety)
      updateTriggerText()

    sel.on 'replace', ->
      wrapper.find('.options').empty()
      copyOptionsToList()

    copyOptionsToList()