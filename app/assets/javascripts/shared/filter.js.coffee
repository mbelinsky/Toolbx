$(document).ready ->
  if $('#filter').length
    filter = $('#filter')
    filterForm = filter.find('form')

    # Actual Filtering
    filterForm.on 'change', ->
      filterForm.submit()

    # Category Switching
    filter.find('.category-icons').on 'click', 'a', ->
      el = $(this)

      el.toggleClass 'active'

      cs = filter.find('.category-select');

      cs.find("option[value=\"#{el.data('category-id')}\"]").prop 'selected', el.hasClass('active')
      cs.trigger('change')

    # # Sorting
    # do ->
    #   orderContainer = $('.select-container.order')
    #   selectTrigger = orderContainer.find('.trigger')
    #   select = orderContainer.find('select')

    #   updateOrderTriggerText = ->
    #     selectTrigger.html select.val()
    #   updateOrderTriggerText()

    #   select.on 'change', updateOrderTriggerText

    # # Platform
    # do ->
    #   platformContainer = $('.select-container.platform')
    #   selectTrigger = platformContainer.find('.trigger')
    #   select = platformContainer.find('select')

    #   updatePlatformTriggerText = ->
    #     selectTrigger.html select.find("option[value=\"#{select.val()}\"]").text()
    #   updatePlatformTriggerText()

    #   select.on 'change', updatePlatformTriggerText
    filter.find('.fancy-platform').fancySelect
      className: 'platform'
    filter.find('.fancy-order').fancySelect
      className: 'order'


    # Docking
    if filter.hasClass 'docked'
      $('.items:first').addClass 'filter-docked'
      $('#top').addClass 'filter-docked'
    else
      filterOffTop = filter.offset().top

      $(window).on 'scroll', ->
        if $(document).scrollTop() > (filterOffTop - 50)
          filter.addClass 'docked'
          $('.items:first').addClass 'filter-docked'
          $('#top').addClass 'filter-docked'
        else
          filter.removeClass 'docked'
          $('.items:first').removeClass 'filter-docked'
          $('#top').removeClass 'filter-docked'

    # Filter trigger
    filterTrigger = $('#filter-trigger')

    filterTrigger.on 'click', (e) ->
      e.stopPropagation();
      e.preventDefault();

      filter.toggleClass 'open'

    filter.bind 'clickoutside', ->
      filter.removeClass 'open'

    # Category Tooltips
    toolTip = filter.find('.tooltip')

    if toolTip
      toolTip.each ->
        width = $(this).outerWidth()
        # - 5px to account for icon padding
        $(this).css {'margin-left': -((width / 2) - 5), 'width': width}
