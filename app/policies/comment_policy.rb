class CommentPolicy
  attr_reader :comment, :user

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def manage?
    comment.user == user
  end
end
