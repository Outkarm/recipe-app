class ShoppingListController < ApplicationController
  def show
    @recipes = current_user.recipes
    @food_items = @recipes.map(&:foods).flatten.uniq
    @general_food_list = current_user.foods
    @foods = @general_food_list - @food_items
    if @foods.present?
      @total_count = @foods.count
      @total_price = @foods.sum(&:price)
    else
      @total_count = 0
      @total_price = 0
    end
  end
end
