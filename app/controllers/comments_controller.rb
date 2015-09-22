class CommentsController < ApplicationController
  before_action :authenticate_user!
  # respond_to :js

  expose(:article)

  expose(:comments)
  expose(:comment, attributes: :comments_params)

  def create
    comment.user = current_user
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
    params.require(:comment).permit(:user_id, :text, :article_id).merge(article_id: article.id)
  end
end
