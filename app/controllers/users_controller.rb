class UsersController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  expose(:user)
  expose(:article) { Article.new() }
end
