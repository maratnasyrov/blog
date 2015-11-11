class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :can_manage?, only: %i(update, destroy)

  respond_to :html

  expose(:articles)
  expose(:article, attributes: :articles_params)

  expose(:comments) { article.comments }
  expose(:comment)

  def create
    article.save
    redirect_to root_path
  end

  def destroy
    article.destroy
    respond_with(article)
  end

  def update
    article.save
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
