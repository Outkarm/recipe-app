class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @food = Food.includes(:user).all

    return unless @food.empty?

    flash[:notice] = 'No food available. Please add food.'
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user
    if @food.save
      redirect_to foods_path, notice: 'Food item created successfully.'
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path, notice: 'Food item deleted successfully.'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
