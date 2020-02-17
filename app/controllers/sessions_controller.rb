class SessionsController < ApplicationController
  before_action :already_logged_in, only: [:new,:create]
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
       session[:user_id] = user.id
       redirect_to posts_path
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    log_out
    flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end
end
