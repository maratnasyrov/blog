$articles = $('.part')

$articles.each (i) ->
  $article = $(@)
  setTimeout(
    ->
      $article.addClass('zoom')
  i * 400
  )
