if $('html').is '.home.index'
	$(document).ready ->
		billboard = $('#billboard')
		cta = $('#signup-cta')

		if cta.length
			ctaOffTop = cta.offset().top

			$(window).on 'scroll', ->
				if $(document).scrollTop() >= (ctaOffTop - 50)
					cta.addClass 'docked'
					billboard.addClass 'cta-docked'
				else
					cta.removeClass 'docked'
					billboard.removeClass 'cta-docked'