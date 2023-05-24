class RecipeFoodsController < ApplicationController
  def index; end

  def new; end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:recipe_id, :food_id)
  end
end
