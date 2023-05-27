class UsersController < ApplicationController
  def index
    @users = User.includes(:recipes) # Eager loading recipes association
  end

  def show
    @user = User.includes(:recipes).find(params[:id]) # Eager loading recipes association
  end
end
