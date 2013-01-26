if $('html').is('.users.edit, .users.update')
	$(document).ready ->
		# Changing the profile-picture
		profilePictureTrigger = $('.profile-picture').find('button')

		profilePictureTrigger.on 'click', (e) ->
			e.preventDefault()
			$('#user_profile_picture').trigger('click')

		$('#user_profile_picture').on 'change', (e) ->
			val = $(this).val()

			profilePictureTrigger.find('span').text(val.substr(val.lastIndexOf('\\') + 1))
			profilePictureTrigger.siblings('img').remove()


		# Change password
		$('#change-password-trigger').on 'click', (e) ->
			e.preventDefault()
			$(this).hide()
			$('.change-password-container').addClass('editing-password').find('input').prop 'disabled', false


		# City Picker
		$('#city-picker').on 'keyup', ->
			unless $(this).val()
				$("#user_city_name").val('0')

		$('#city-picker').autocomplete
			source: '/cities'
			minLength: 4
			appendTo: $('#city-picker').parent()
			position:
				my: 'left top'
				at: 'left bottom-5'
			select: (e, ui) ->
				$("#user_city_name").val(ui.item.value)
				$("#city-picker").val(ui.item.label)
				return false
			focus: (e, ui) ->
				e.preventDefault()
				$("#user_city_name").val(ui.item.value)
				$("#city-picker").val(ui.item.label)