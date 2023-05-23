class FoodsController < ApplicationController
  def index
    @food = Food.all
  end

  def show
    @food = Food.find(params[:user_id])
  end

  def create
    @food = Food.new(food_params)
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
