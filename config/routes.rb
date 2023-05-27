Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions', registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # config/routes.rb
  resources :foods
  resources :users

  resources :shopping_list, only: [:index]

  resources :public_recipes, only: [:index, :show]

  # Defines the root path route ("/")
  # root "articles#index"

  # config/routes.rb

  resources :recipes do
    resources :recipe_foods
  end

  root "foods#index"
end
