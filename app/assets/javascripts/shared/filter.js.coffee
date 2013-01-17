$(document).ready ->
	if $('#filter').length
		filter = $('#filter')
		filterForm = filter.find('form')

		filterForm.on 'change', ->
			filterForm.submit()

		if filter.hasClass 'docked'
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