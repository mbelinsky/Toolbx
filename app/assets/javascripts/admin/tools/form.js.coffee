if $('html').is('.admin.tools.edit, .admin.tools.update, .admin.tools.new, .admin.tools.create')
	$(document).ready ->
		iconTrigger = $('.icon').find('button')

		iconTrigger.on 'click', (e) ->
			e.preventDefault()
			$('#tool_icon').trigger('click')

		$('#tool_icon').on 'change', (e) ->
			val = $(this).val()

			iconTrigger.css(
				padding: '6px 3px'
			).html(val.substr(val.lastIndexOf('\\') + 1))