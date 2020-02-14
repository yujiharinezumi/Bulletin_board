class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to new_post_path
  end

  def show
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end
end
