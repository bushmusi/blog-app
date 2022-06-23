class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :update_allowed_parameters, if: :devise_controller?

  def all_users
    User.all.order('created_at desc')
  end

  def current_post
    User.find(params[:user_id]).posts.find(params[:id] || params[:post_id])
  end

  def all_posts
    User.find(params[:user_id])
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end
