class Meal < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :day,  presence: true
end
