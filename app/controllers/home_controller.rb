class HomeController < ApplicationController

  def   index
    @wishes = Wish.includes(:user).all
  end

end