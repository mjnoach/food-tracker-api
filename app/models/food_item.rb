class FoodItem < ApplicationRecord

  belongs_to :user
  has_many :ingredients, dependent: :destroy
  has_many :recipes, through: :ingredients
  
  validates :name,  presence: true, 
                    :uniqueness => {:case_sensitive => false, :scope => :user_id}
end
