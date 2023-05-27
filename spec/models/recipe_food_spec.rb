require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  include Shoulda::Matchers::ActiveModel
  let(:user1) { FactoryBot.create(:user, name: Faker::Name.name, email: 'example1@gmail.com', password: 1_111_111_111) }
  let(:user2) { FactoryBot.create(:user, name: Faker::Name.name, email: 'example2@gmail.com', password: 1_111_111_111) }
  let(:recipe1) { FactoryBot.create(:recipe, user_id: user1.id) }
  let(:recipe2) { FactoryBot.create(:recipe, user_id: user1.id) }
  let(:recipe3) { FactoryBot.create(:recipe, user_id: user2.id) }
  let(:food1) do
    FactoryBot.create(:food, user_id: user1.id, name: 'Jollof Rice', measurement_unit: 'Cup', price: 100, quantity: 1)
  end
  let(:food2) do
    FactoryBot.create(:food, user_id: user1.id, name: 'Fried Rice', measurement_unit: 'Cup', price: 100, quantity: 1)
  end
  let(:recipe_food1) { FactoryBot.create(:recipe_food, recipe_id: recipe1.id, food_id: food1.id, quantity: 5) }
  let(:recipe_food2) { FactoryBot.create(:recipe_food, recipe_id: recipe2.id, food_id: food2.id, quantity: 10) }

  describe 'Validations' do
    it 'requires a recipe_id' do
      expect(recipe_food1.recipe).to eq(recipe1)
      expect(recipe_food2.recipe).to eq(recipe2)
    end

    it 'requires a food_id' do
      expect(recipe_food1.food).to eq(food1)
      expect(recipe_food2.food).to eq(food2)
    end

    it 'requires a quantity' do
      expect(recipe_food1).to validate_presence_of(:quantity)
      expect(recipe_food2).to validate_presence_of(:quantity)
    end
  end
end
