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