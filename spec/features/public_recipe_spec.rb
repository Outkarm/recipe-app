require 'rails_helper'

RSpec.feature 'Public Recipes', type: :feature do
  describe 'Public Recipe Index Page' do
    before :each do
      visit new_user_session_path
      @user = User.create(name: 'Ezekiel', email: 'example1@gmail.com', password: '1111111111')
      @user.confirm
      @user2 = User.create(name: 'Famous', email: 'famous@gmail.com', password: '1111111111')
      @user2.confirm
      @recipe1 = Recipe.create(name: 'Recipe 1', preparation_time: 1, cooking_time: 2, description: 'making sense',
                               public: false, user_id: @user.id)
      @recipe2 = Recipe.create(name: 'Recipe 2', preparation_time: 1, cooking_time: 2, description: 'making sense',
                               public: true, user_id: @user2.id)
      @recipe3 = Recipe.create(name: 'Recipe 3', preparation_time: 1, cooking_time: 2, description: 'making sense',
                               public: true, user_id: @user2.id)

      fill_in 'Email', with: @user.email
      fill_in 'Password',	with: @user.password
      click_on 'Log in'
      click_on 'Public Recipes'
    end

    scenario 'User sees the public recipes title' do
      visit public_recipes_path
      expect(page).to have_content('Public Recipes')
    end

    scenario 'User sees the recipe name' do
      visit public_recipes_path
      @public_recipes = Recipe.includes(:foods).where(public: true).order('created_at DESC')
      expect(@public_recipes.count).to eq(2)
    end

    scenario 'User sees public recipe name' do
      visit public_recipes_path
      @public_recipes = Recipe.includes(:foods).where(public: true).order('created_at DESC')
      @public_recipes.each do |recipe|
        expect(page).to have_content(recipe.name)
      end
    end

    scenario 'User sees public recipe author name' do
      visit public_recipes_path
      @public_recipes = Recipe.includes(:foods).where(public: true).order('created_at DESC')
      @public_recipes.each do |recipe|
        expect(page).to have_content(recipe.user.name)
      end
    end

    scenario 'User sees the total price of the recipe' do
      visit public_recipes_path
      @public_recipes = Recipe.includes(:foods).where(public: true).order('created_at DESC')
      @public_recipes.each do |recipe|
        expect(page).to have_content(recipe.recipe_food.count)
      end
    end

    scenario 'User sees the total price of the recipe' do
      visit public_recipes_path
      @public_recipes = Recipe.includes(:foods).where(public: true).order('created_at DESC')
      click_on @public_recipes[0].name
      expect(page).to have_current_path(recipe_path(@public_recipes[0].id))
    end
  end
end
