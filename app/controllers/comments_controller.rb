class CommentsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html

  expose(:article)

  expose (:comments)
  expose (:comment)

  def create
    comment = comments.new(comments_params)
    comment.save
    redirect_to article_path(article)
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
