class Recipe < ApplicationRecord
  belongs_to :user
  
  has_many :ingredients, dependent: :destroy
  has_many :food_items, through: :ingredients
  
  has_many :meals, dependent: :destroy

  validates :name,  presence: true, 
                    :uniqueness => {:case_sensitive => false, :scope => :user_id}
end