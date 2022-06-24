class UsersController < ApplicationController
  # User controller
  def index
    @users = all_users
  end

  def show
    @user = User.find(params[:id] || params[:user_id])
  end
end
