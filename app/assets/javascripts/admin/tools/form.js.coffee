if $('html').is('.admin.tools.edit, .admin.tools.update, .admin.tools.new, .admin.tools.create')
	$(document).ready ->
		# Changing the icon
		iconTrigger = $('.icon').find('button')

		iconTrigger.on 'click', (e) ->
			e.preventDefault()
			$('#tool_icon').trigger('click')

		$('#tool_icon').on 'change', (e) ->
			val = $(this).val()

			iconTrigger.css(
				padding: '6px 3px'
			).html(val.substr(val.lastIndexOf('\\') + 1))

		# Chosen Selects
		$('#tool_license_id').chosen()
		$('#tool_platform_ids').chosen()
		$('#tool_category_ids').chosen()

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

			if screensContainer.find('li:visible').length > 3
				return

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