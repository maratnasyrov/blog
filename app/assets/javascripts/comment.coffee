$(document).ready ->
  $commentButton = $('#comment-submit')
  $commentText = $('#comment-text')

  $commentButton.on 'click', (e) ->
    $.ajax
      success: (data) ->
        $commentText.val("")
        return

