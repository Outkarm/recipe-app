class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.includes(:foods).where(public: true)
  end

  def show; end
end
