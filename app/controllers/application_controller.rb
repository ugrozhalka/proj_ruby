class ApplicationController < ActionController::Base
  helper_method :current_user, :user_signed_in?
  before_action :set_current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    redirect_to root_path, alert: "You must be logged in to access this section." unless current_user
  end

  def user_signed_in?
    !!current_user
  end

  private
  def set_current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def destroy_session
    session[:user_id] = nil
    cookies.delete(:remember_token) if cookies[:remember_token]
  end
end

