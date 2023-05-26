require 'rails_helper'

RSpec.feature 'Recipes', type: :feature do
  describe 'Recipe Show Page' do
    before :each do
      visit new_user_session_path
      @user = User.create(name: 'Ezekiel', email: 'example1@gmail.com', password: '1111111111')
      @user.confirm
      @recipe1 = Recipe.create(name: 'Recipe 1', preparation_time: 1, cooking_time: 2, description: 'making sense',
                               public: true, user_id: @user.id)
      @recipe2 = Recipe.create(name: 'Recipe 2', preparation_time: 1, cooking_time: 2, description: 'making sense',
                               public: true, user_id: @user.id)
      @recipe3 = Recipe.create(name: 'Recipe 3', preparation_time: 1, cooking_time: 2, description: 'making sense',
                               public: true, user_id: @user.id)

      fill_in 'Email', with: @user.email
      fill_in 'Password',	with: @user.password
      click_on 'Log in'
      click_on 'Recipes'
    end

    scenario 'User sees a list of recipes' do
      visit recipes_path
      @recipes = Recipe.all
      click_on @recipes[0].name
      expect(page).to have_current_path(recipe_path(@recipes[0].id))
    end

    scenario 'User sees the recipe name' do
      visit recipes_path
      @recipes = Recipe.all
      click_on @recipes[0].name
      expect(page).to have_current_path(recipe_path(@recipes[0].id))
      expect(page).to have_content(@recipes[0].name)
    end

    scenario 'User sees the recipe name' do
      visit recipes_path
      @recipes = Recipe.all
      click_on @recipes[0].name
      expect(page).to have_current_path(recipe_path(@recipes[0].id))
      expect(page).to have_content(@recipes[0].preparation_time)
    end

    scenario 'User sees the recipe name' do
      visit recipes_path
      @recipes = Recipe.all
      click_on @recipes[0].name
      expect(page).to have_current_path(recipe_path(@recipes[0].id))
      expect(page).to have_content(@recipes[0].cooking_time)
    end
  end
end
