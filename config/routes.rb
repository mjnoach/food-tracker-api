Rails.application.routes.draw do

  resources :users, :food_items, :recipes, :meals

  # resources :recipes, shallow: true do
  # 	resources :ingredients, only: [:index]
  # end

  post 'auth/login', to: 'authentication#login'
  get '/a*', to: 'application#not_found'
end