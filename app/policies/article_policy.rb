class ArticlePolicy
  def initialize(user, article)
    @user = user
    @article = article
  end

  def manage?
    @article.privacy == false || @article.user == @user
  end
end
