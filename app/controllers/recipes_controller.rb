class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def create
    recipe_data = params.require(:recipe).permit(:name, :description, :instructions)
    @recipe = Recipe.create(recipe_data)
  end

  def destory

  end

  private

  def recipe_params

  end

end
