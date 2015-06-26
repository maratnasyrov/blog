class ArticlesController < ApplicationController
  before_action :authenticate_user!

  respond_to :html, :js

  expose(:articles)
  expose(:article, attributes: :articles_params)

  expose(:comments) { article.comments }
  expose(:comment)

  def create
    if article.save
      redirect_to root_path
    else
      respond_to do |format|
        format.html { render action: 'new' }
        format.json { render json: article.errors, status: :unprocessable_entity }
        format.js { render json: article.errors, status: :unprocessable_entity }
      end
    end
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
