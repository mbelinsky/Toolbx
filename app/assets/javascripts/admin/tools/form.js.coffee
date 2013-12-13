if $('html').is('.admin.tools.edit, .admin.tools.update, .admin.tools.new, .admin.tools.create')
  $(document).ready ->
    $('#tool-search-tag-ids').select2
      initSelection: (el, cb) ->
        tags = $.parseJSON(el.val())

        return el.val('') unless tags

        actualVal = []
        for tag in tags
          actualVal.push tag.id
        el.val(actualVal.join(','))

        cb(tags)
      multiple: true
      minimumInputLength: 1
      createSearchChoice: (term) ->
        return {id: term, text: term}
      ajax:
        url: '/admin/search-tags'
        dataType: 'json'
        data: (term, page) ->
          return {q: term}
        results: (term, page) ->
          return {results: term, more: false}

    # Changing the icon
    iconTrigger = $('.icon').find('button')

    iconTrigger.on 'click', (e) ->
      e.preventDefault()
      $('#tool_icon').trigger('click')

    $('#tool_icon').on 'change', (e) ->
      val = $(this).val()

      iconTrigger.find('span').text(val.substr(val.lastIndexOf('\\') + 1))
      iconTrigger.siblings('img').remove()

    # Screenshot stuff
    screensContainer = $('.screens').find('ul')

    # Deleting screenshots
    screensContainer.on 'click', '.delete', (e) ->
      e.preventDefault()

      el = $(this)

      el.parent().find('.destroy').val('true')
      el.closest('.screen').hide()

    # Reordering Screenshots
    screensContainer.sortable
      containment: $('.screens-inner')
      distance: 5
      update: ->
        # Update screens order after dragging.
        screensContainer.find('li').each (i, screen) ->
          screen = $(screen)
          screen.find('.order').val(screen.index())
          console.log screen[0]

    # Adding Screenshots
    $('.screens').on 'click', '.add_fields', (e) ->
      e.preventDefault()

      el = $(this)
      time = Date.now()
      regexp = new RegExp(el.data('id'), 'g')

      newScreen = $(el.data('fields').replace(regexp, time))
      newScreen.find('.order').val(screensContainer.find('li').length + 1)

      screensContainer.append(newScreen)

    # Changing a screenshot
    screensContainer.on 'click', '.picker', (e) ->
      e.preventDefault()
      $(this).closest('.screen').find('.screen-file').trigger('click')

    screensContainer.on 'change', '.screen-file', (e) ->
      el = $(this)
      val = el.val()
      picker = el.siblings('.picker')

      picker.find('.name').html(val.substr(val.lastIndexOf('\\') + 1))
      picker.find('img').remove()

    # Character counter for article titles
    charCounter = $('.char-counter')

    charCounter.find('.count').text($('#tool_short_desc').val().length)
    # Update on KeyPress
    $("#tool_short_desc").keyup ->
      charCounter.find('.count').text(0 + $(this).val().length)
      # Bold the span if we reach the limit
      if parseInt($('.count').text()) > 60
        charCounter.addClass('warning')
      else
        charCounter.removeClass('warning')