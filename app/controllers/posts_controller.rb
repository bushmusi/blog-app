class PostsController < ApplicationController
  # Post index func
  def index
    @user = current_user
    @posts = @user.posts.order('id asc')
  end

  # Post with given id
  def show
    @current_post = current_post
  end
end
