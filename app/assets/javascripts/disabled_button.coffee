$(document).ready ->
  $newButton = document.getElementById("new")
  $newPopover = document.getElementById("new-article")
  $current_url = window.location.href
  $regex = /articles\/\d/

  $matcher = $current_url.match($regex)

  if $matcher[0] != null
    $newButton.disabled = true
    $newPopover.remove()

