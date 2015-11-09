readURL = (input) ->
  if input.files && input.files[0]
    reader = new FileReader()

    reader.onload = (e) ->
      $('#preview').attr('src', e.target.result)

    reader.readAsDataURL input.files[0]
    $('.img-input').addClass('background-hidden')

$('#upload-photo').change ->
  readURL this

