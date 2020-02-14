class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "掲示板に投稿しました。"
    else
      render :new
    end
  end

  def show
    # @post = Post.find(params[:id])
  end

  def edit
    # @post = Post.find(params[:id])
  end

  def update
     # @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to posts_path, notice: "投稿を編集しました"
      else
        render :edit
      end
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
