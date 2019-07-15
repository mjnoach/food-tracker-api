class User < ApplicationRecord
  has_secure_password

  has_many :food_items
  has_many :recipes

  validates :name,  presence: true,
                    length: {minimum: 3, maximum: 50}

  validates :email, presence: true, 
                    uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP }
                    
  validates :password,  presence: true,
                        length: {minimum: 6}
end
