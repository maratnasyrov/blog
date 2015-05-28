def CommentPolicy
  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def manage?
    @comment.user == @user
  end
end
