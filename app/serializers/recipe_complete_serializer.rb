class RecipeCompleteSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :food_items, key: :ingredients 

  class FoodItemSerializer < ActiveModel::Serializer
    attributes :id, :name
  end
end
