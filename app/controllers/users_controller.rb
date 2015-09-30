class UsersController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  expose(:users)
  expose(:user)
  expose(:article) { Article.new() }


  def index
  end
end
