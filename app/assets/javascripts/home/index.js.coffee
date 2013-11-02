if $('html').is '.home.index'
	$(document).ready ->
		billboard = $('#billboard')
		cta = $('#signup-cta')

		if cta.length
			ctaOffTop = cta.offset().top

			# Update offset if window size changes (for media query stuff)
			$(window).on 'resize', ->
				ctaOffTop = cta.offset().top

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