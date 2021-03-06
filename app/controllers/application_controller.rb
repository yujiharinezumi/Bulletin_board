class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def authenticate_user
    if current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to new_session_path
    end
  end

  def already_logged_in
    if current_user != nil
      flash[:notice] = "すでにログインしています"
      redirect_to posts_path
    end
  end
end
