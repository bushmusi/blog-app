class ApplicationController < ActionController::Base
  def current_user
    User.find(params[:user_id])
  end

  def all_users
    User.all.order('created_at desc')
  end

  def current_post
    User.find(params[:user_id]).posts.find(params[:post_id])
  end

  def user_post
    User.find(params[:user_id])
  end
end
