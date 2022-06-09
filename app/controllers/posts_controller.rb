class PostsController < ApplicationController
  # Post index func
  def index
    @index = 'Posts on index def'
  end

  # Post with given id
  def show
    @show = 'Posts on show def'
  end
end
