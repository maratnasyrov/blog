class CommentsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :js

  expose(:article)

  expose(:comments)
  expose(:comment, attributes: :comments_params)

  def create
    if comment.save
      respond_to do |format|
        format.html
        format.js { render 'comments/_comments' }
      end
    else
    end
  end

  def destroy
    comment.destroy
    redirect_to article_path(article)
  end

  private

  def comments_params
    params.require(:comment).permit(:user_id, :text, :article_id).merge(user_id: current_user.id, article_id: article.id)
  end
end
