if $('html').is('.admin.tools.edit, .admin.tools.new')
	$(document).ready ->
		$('.icon').find('button').on 'click', (e) ->
			e.preventDefault()
			$('#tool_icon').trigger('click')