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
      redirect_to root_path, notice: "Registration completed. You are now logged in." # Перенаправляем на профиль
    else
      flash[:error1] = "Такой пользователь уже существует!"
      redirect_to users_index_path
    end
  end



  def profile
    @user = @current_user # Передаем текущего пользователя в представление
    @fulfillments = Fulfillment.where(performer_id: @user.id)
  end


  def destroy
    if @current_user.destroy
      session[:user_id] = nil
      redirect_to root_path, notice: 'Аккаунт успешно удален.'
    else
      redirect_to profile_user_path(@current_user), alert: 'Возникла ошибка при удалении аккаунта'
    end
  end

  private

  def set_current_user
    user = User.find_by(id: session[:user_id])
    if user.nil?
      redirect_to root_path
    else
      @current_user = user if session[:user_id]
    end
  end

  def user_params
    params.require(:user).permit(:login, :email, :password)
  end
end

