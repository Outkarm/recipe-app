class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def new; end

  def create
    @recipe = Recipe.create(recipe_params)
  end

  def destory
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :instructions)
  end
end
