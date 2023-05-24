class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def show
    @recipe = Recipe.includes(:recipe_foods).find_by(id: params[:id])
  end

  def new; end

  def create
    @recipe = Recipe.create(recipe_params)
  end

  def destroy
    recipe = Recipe.find(params[:id])
    if recipe.destroy
      flash[:success] = 'Recipe deleted successfully'
      redirect_to recipe_path(recipe.id)
    else
      flash.now[:error] = "Recipe couldn't be deleted"
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :instructions)
  end
end
