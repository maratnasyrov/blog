class ArticlePolicy
  attr_reader :user, :article

  def initialize(user, article)
    @user = user
    @article = article
  end

  def manage?
    article.privacy == false || edit?
  end

  def edit?
    article.user == user
  end

  def redirect
    redirect_to root_path
  end
end
