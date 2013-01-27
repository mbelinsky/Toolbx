if $('html').is '.about.index'
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
		else
			billboardHeight = billboard.outerHeight()
			top = $('#top')

			$(window).on 'scroll', ->
				if $(document).scrollTop() >= (billboardHeight)
					top.removeClass('toolbar-docked')
				else
					top.addClass('toolbar-docked')