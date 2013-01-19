$(document).ready ->
	if $('#filter').length
		filter = $('#filter')
		filterForm = filter.find('form')

		# Actual Filtering
		filterForm.on 'change', ->
			filterForm.submit()

		# Category Switching
		filter.find('.categories').on 'click', 'li', ->
			el = $(this)

			el.toggleClass 'active'

			cs = filter.find('.category-select');

			cs.find("option[value=\"#{el.data('category-id')}\"]").prop 'selected', el.hasClass('active')
			cs.trigger('change')

		# Sorting
		selectContainer = $('.select-container')
		selectTrigger = selectContainer.find('.trigger')
		select = selectContainer.find('select')

		updateSelectTriggerText = ->
			console.log select.val()
			selectTrigger.html select.val()
		updateSelectTriggerText()

		select.on 'change', ->
			updateSelectTriggerText()

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