class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update,:destroy]
  before_action :check_user, only:[:edit,:update,:destroy]
  before_action :authenticate_user

  def index
    @posts = Post.all.text_search(params.dig(:post,:text)).category_search(params.dig(:post, :categories_ids)).order(id:"DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: "掲示板に投稿しました。"
    else
      render :new
    end
  end

  def show
    @comments = @post.comments
    @comment = @post.comments.build
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "投稿を編集しました。"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice:"投稿を削除しました。"
  end

  private

  def post_params
    params.require(:post).permit(:text, category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def check_user
    if @post.user.id != current_user.id
      redirect_to posts_path,notice:"権限がありません"
    end
  end
end
