class WishesController < ApplicationController
  before_action :set_wish, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @wishes = Wish.all.includes(:user)
  end

  def new
    @wish = Wish.new
  end

  def create
    @wish = current_user.wishes.build(wish_params)

    if @wish.save
      redirect_to profile_user_path(@current_user), notice: "Wish created successfully."

    else
      render :index
    end
  end

  def show
  end

  def edit
  end

  def update
    if @wish.update(wish_params)
      redirect_to profile_user_path(@current_user), notice: "Wish updated successfully."
    else
      render :edit
    end
  end

  def destroy
    if @wish.user == current_user # Проверяем, что пользователь является владельцем пожелания
      @wish.destroy
      redirect_to profile_user_path(@current_user), notice: 'Пожелание успешно удалено.'
    else
      redirect_to profile_user_path(@current_user), alert: 'Вы не можете удалить это пожелание.'
    end
  end

  private

  def set_wish
    @wish = Wish.find(params[:id])
  end

  def wish_params
    params.require(:wish).permit(:title, :description)
  end

  def authenticate_user!
    redirect_to root_path, alert: "You must be logged in to access this section." unless session[:user_id]
  end
end

