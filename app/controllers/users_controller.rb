# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :set_current_user, only: [:profile, :destroy] # Добавляем profile в before_action

  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_profile_path, notice: "Registration completed. You are now logged in." # Перенаправляем на профиль
    else
      redirect_to users_index_path, alert: @user.errors.full_messages.join(", ") # Сообщаем об ошибках
    end
  end



  def profile
    @user = @current_user # Передаем текущего пользователя в представление
  end


  def destroy
    session[:user_id] = nil
    redirect_to(root_path)
  end

  private

  def set_current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def user_params
    params.require(:user).permit(:login, :email, :password)
  end
end

