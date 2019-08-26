class User < ApplicationRecord
  has_secure_password

  has_many :food_items, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :meals, dependent: :destroy

  validates :name,  presence: true,
                    length: {minimum: 3, maximum: 50}

  validates :email, presence: true, 
                    uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP }
                    
  validates :password,  presence: true,
                        length: {minimum: 6}
end
