readURL = (input, id, el_class) ->
  if input.files && input.files[0]
    reader = new FileReader()

    reader.onload = (e) ->
      $(id).attr('src', e.target.result)

    reader.readAsDataURL input.files[0]
    $(el_class).addClass('background-hidden')

$('#upload-photo').change ->
  readURL this, '#preview', '.img-input'

$('#profile-photo').change ->
  readURL this, '#preview-profile', '.img-input-profile'

