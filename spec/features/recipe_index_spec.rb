require 'rails_helper'

RSpec.feature 'Recipes', type: :feature do
  describe 'Recipe Index Page' do
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

    scenario 'User visits the recipes index page' do
      expect(page).to have_current_path(recipes_path)
    end

    scenario 'User sees a welcome message with his name' do
      expect(page).to have_content("Hello #{@user.name}")
    end

    scenario "User sees an 'Add Recipe' button" do
      expect(page).to have_content('Add Recipe')
    end

    scenario 'User sees a list of recipes' do
      @recipes = Recipe.all
      @recipes.each do |recipe|
        expect(page).to have_content(recipe.name)
      end
    end
  end
end
