class FoodsController < ApplicationController
  before_action :authenticate_user!
  def index
    return unless user_signed_in?

    @food = Food.find(params[:user_id])
  end

  def show; end

  def new
    return unless user_signed_in?

    @food = Food.new(food_params)
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
