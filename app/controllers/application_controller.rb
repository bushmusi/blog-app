class ApplicationController < ActionController::Base
  def current_user
    User.find(params[:id] || params[:user_id])
  end

  def all_users
    User.all.order('created_at desc')
  end

  def current_post
    User.find(params[:user_id]).posts.find(params[:id] || params[:post_id])
  end

  def all_posts
    User.find(params[:user_id])
  end
end
