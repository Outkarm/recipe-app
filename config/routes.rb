Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # config/routes.rb
  resources :foods
  resources :users

  # Defines the root path route ("/")
  # root "articles#index"
end
