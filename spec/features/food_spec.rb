require 'rails_helper'

RSpec.describe 'food', type: :system do
  describe 'food' do
    before :each do
      visit new_user_session_path
      @user = User.create(name: 'ezekiel', email: 'ezekiel@example.com', password: '1111111111')
      @user.confirm
      @food = Food.create(name: 'beans', quantity: 10, measurement_unit: 'grams', price: 50, user_id: @user.id)
      @foodtwo = Food.create(name: 'potatoes', quantity: 20, measurement_unit: 'grams', price: 100, user_id: @user.id)
      @foodthree = Food.create(name: 'tacos', quantity: 30, measurement_unit: 'grams', price: 200, user_id: @user.id)
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_on 'Log in'
    end

    it 'should display the first food created by the user' do
      expect(page).to have_content 'beans'
    end

    it 'should display the list of all food created by user' do
      @foods = Food.all
      @foods.each do |food|
        expect(page).to have_content(food.name)
      end
    end

    it 'should delete the current food' do
      @foods = Food.all
      @foods.each do |food|
        click_on "Delete #{food.name}"
        expect(page).to_not have_content(food.name)
      end
    end

    it 'Add new food' do
      click_on 'Add Food', class: 'add-btn'
      expect(page).to have_current_path(new_food_path)
    end
  end
end
