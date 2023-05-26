require 'rails_helper'
require 'faker'

RSpec.describe Recipe, type: :model do
  include Shoulda::Matchers::ActiveModel
  let(:user1) { FactoryBot.create(:user, name: Faker::Name.name, email: 'example1@gmail.com', password: 1_111_111_111) }
  let(:user2) { FactoryBot.create(:user, name: Faker::Name.name, email: 'example2@gmail.com', password: 1_111_111_111) }
  let(:recipe1) { FactoryBot.create(:recipe, user_id: user1.id) }
  let(:recipe2) { FactoryBot.create(:recipe, user_id: user1.id) }
  let(:recipe3) { FactoryBot.create(:recipe, user_id: user2.id) }

  describe 'Validations' do
    it 'requires a name' do
      expect(recipe1).to validate_presence_of(:name)
      expect(recipe2).to validate_presence_of(:name)
    end

    it 'requires a description' do
      expect(recipe1).to validate_presence_of(:description)
      expect(recipe2).to validate_presence_of(:description)
    end

    it ' requires a preparation_time' do
      expect(recipe1).to validate_presence_of(:preparation_time)
      expect(recipe2).to validate_presence_of(:preparation_time)
    end

    it 'requires a cooking_time' do
      expect(recipe1).to validate_presence_of(:cooking_time)
      expect(recipe2).to validate_presence_of(:cooking_time)
    end

    it 'requires a user_id' do
      expect(recipe1.user_id).to eq(user1.id)
      expect(recipe3.user_id).to eq(user2.id)
    end
  end
end
