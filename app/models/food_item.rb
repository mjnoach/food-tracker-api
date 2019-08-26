class FoodItem < ApplicationRecord
  belongs_to :user
  
  has_many :ingredients, dependent: :destroy
  has_many :recipes, through: :ingredients
  
  validates :name,  presence: true,
                    :uniqueness => {:case_sensitive => false, :scope => :user_id}

  validates :quantity, :numericality => { :greater_than_or_equal_to => 0 }
end
