class UsersController < ApplicationController

  def index
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = user.id
      redirect_to root_path, notice: "Registration completed"
    else
      redirect_to users_index_path, alert: @user.errors.full_messages.join
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to(root_path)
  end

  private
  def user_params
    params.require(:user).permit(:login, :email, :password)
  end

end