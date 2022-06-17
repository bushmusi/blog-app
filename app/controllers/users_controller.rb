class UsersController < ApplicationController
  # User controller
  def index
    @users = all_users
  end

  def show
    @posts = fetch_posts
  end
end
