class PostsController < ApplicationController
  # Post index func
  def index
    @user = current_user
    @posts = @user.posts.includes(:comments).order('id asc')
  end

  # Post with given id
  def show
    @current_post = current_post
  end

  def new
    respond_to do |format|
      format.html { render :new, locals: { post: Post.new } }
    end
  end

  def create
    user = current_user
    user.posts_counter += 1
    user.save
    post = Post.new(post_params)
    post.author = user
    post.comments_counter = post.likes_counter = 0
    if post.save
      flash[:success] = 'Post saved successfully'
      redirect_to user_posts_url
    else
      flash[:error] = 'Error: Post could not be saved'
      redirect_to new_user_post_url
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
