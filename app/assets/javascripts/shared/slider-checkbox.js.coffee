$.fn.sliderCheckbox = (options) ->
	settings = $.extend({
		offLeft: -64
	}, options)

	return this.each ->
		el = $(this)
		inp = el.find 'input:checkbox'
		slider = el.find '.slider'

		inp.on 'focus', ->
			el.addClass 'focused'

		inp.on 'blur', ->
			el.removeClass 'focused'

		el.on 'click', (e) ->
			inp.prop 'checked', !inp.prop('checked')
			updateIndicator()


		updateIndicator = ->
			checked = inp.prop 'checked'
			inp.val(if checked then 'on' else 'off')
			moveTo = if checked then 0 else settings.offLeft

			setTimeout ->
				slider.parent().toggleClass('checked', checked);
			, 90

			slider.css 'left', moveTo

		updateIndicator()
		inp.on 'click', (e) ->
			e.stopPropagation()
		inp.on 'change', updateIndicator
