class MealSerializer < ActiveModel::Serializer
  attributes :id, :day
  belongs_to :recipe
end
