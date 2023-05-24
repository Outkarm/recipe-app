class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.includes(:foods).where(public: true).order('created_at DESC')
  end

  def show; end
end
