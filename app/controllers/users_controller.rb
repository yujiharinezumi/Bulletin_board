class UsersController < ApplicationController
  before_action :set_user,only: [:show,:edit,:update,:destroy]
  before_action :check_user,only: [:edit,:update,:destroy]
  before_action :authenticate_user,only: [:index, :edit, :update, :show, :destroy]
  before_action :already_logged_in, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to posts_path,notice:"ようこそ掲示板サイトへ！"
    else
      flash.now[:danger] = 'サインアップに失敗しました'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to posts_path,notice:"ユーザー情報を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to new_user_path, notice:"アカウントを削除しました！"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def check_user
    if @user.id != current_user.id
      redirect_to posts_path,notice:"権限がありません"
    end
  end
end
