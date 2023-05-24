class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true
  validates :public, presence: true, allow_blank: true

  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

  def recipe_food
    RecipeFood.where(recipe_id: id)
  end
end
