$message = $('#message')
setTimeout(
  ->
    $message.addClass('zoom-to-max')
500
)
setTimeout(
  ->
    $message.addClass('hidden')
4500
)
