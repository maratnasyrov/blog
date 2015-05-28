def CommentPolicy
  attr_reader :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def manage?
    comment.user == @user
  end
end
