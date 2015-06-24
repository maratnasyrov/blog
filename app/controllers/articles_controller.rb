class ArticlesController < ApplicationController
  before_action :authenticate_user!

  respond_to :html, :js

  expose (:articles)
  expose (:article)

  expose(:comments) { article.comments }
  expose(:comment)

  def create
    article = articles.new(articles_params)
    article.save
    redirect_to root_path
  end

  def destroy
    article.destroy
    respond_with(article)
  end

  def update
    article.update(articles_params)
    respond_with(article)
  end

  def my_articles
    render 'my'
  end

  def my_private_posts
    render 'private'
  end

  private

  def articles_params
    params.require(:article).permit(:title, :text, :image, :privacy).merge(user_id: current_user.id)
  end
end
