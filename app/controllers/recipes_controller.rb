class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def show
    @recipe = Recipe.includes(:recipe_foods).find(params[:id])
  end

  def new; end

  def create
    name = params[:name]
    cooking_time = params[:cooking_time]
    description = params[:description]
    preparation_time = params[:preparation_time]
    public = params[:public]
    @recipe = Recipe.create(name:, cooking_time:, description:,
                            preparation_time:, public:)
    @recipe.user_id = current_user.id
    if @recipe.save
      flash[:success] = 'Successfully created...'
      redirect_to recipes_path
    else
      flash.now[:error] = 'Recipe could not be created...'
    end
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
    params.require(:recipes).permit(:name, :cooking_time, :preparation_time, :public, :description)
  end
end
