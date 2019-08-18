Rails.application.routes.draw do

  resources :users, :food_items, :recipes

  # resources :recipes, shallow: true do
  # 	resources :ingredients, only: [:index]
  # end

  post 'auth/login', to: 'authentication#login'
  get '/a*', to: 'application#not_found'
end

# create
# POST
# /recipes/:id/ingredients

# index
# GET
# /recipes/:id/ingredients

# update
# PUT
# /ingredients/:id

# destroy
# DELETE
# /ingredients/:id


# 1. Creating recipe - creating ingredients records - no separate route needed (handled within Recipe route)
# 2. Fetching recipe - fetching ingredients records - no separate route needed (handled within Recipe route)
# 3. Editing recipe - editing ingredients - 
# 4. Deleting recipe - deleting ingredients records - no separate route needed (handled withing Recipe route)