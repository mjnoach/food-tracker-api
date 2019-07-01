Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :food_items
  post '/login', to: 'users#login'
  get '/a*', to: 'application#not_found'
end
