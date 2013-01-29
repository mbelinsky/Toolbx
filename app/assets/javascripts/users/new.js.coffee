if $('html').is '.users.new, .users.create'
  $(document).ready ->
    switchType = ->
      if $('#user_type_organization').prop 'checked'
        $('#new_person').hide()
        $('#new_organization').show()
      else
        $('#new_organization').hide()
        $('#new_person').show()

    switchType()

    $('input[type="radio"][name="user_type"]').on 'change', switchType