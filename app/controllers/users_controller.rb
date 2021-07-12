class UsersController < ApplicationController
  def index
    @users = User.includes(:active_relationships)
  end
  def show
    @user = current_user
  end
end
