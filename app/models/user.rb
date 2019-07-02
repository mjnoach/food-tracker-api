class User < ApplicationRecord
  has_secure_password

  has_many :food_items

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
