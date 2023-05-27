class RecipeFoodsController < ApplicationController
  def index; end

  def new; end

  def create
    food = Food.find(params[:food_id])
    recipe = Recipe.find(params[:recipe_id])
    quantity = params[:quantity].to_i
    @recipe_food = RecipeFood.new(quantity:, food_id: food.id, recipe_id: recipe.id)
    @recipe_food.recipe_id = params[:recipe_id]
    if @recipe_food.save
      flash[:success] = 'Recipe Food created successfully'
      redirect_to recipe_path(recipe.id)
    else
      flash.now[:error] = "Recipe Food couldn't be created"
      render 'new'
    end
  end

  def destroy
    recipe_food = RecipeFood.find(params[:id])
    if recipe_food.destroy
      flash.now[:success] = 'Recipe deleted successfully'
      redirect_to recipe_path(recipe_food.recipe)
    else
      flash.now[:error] = "Recipe couldn't be deleted"
    end
  end
end
