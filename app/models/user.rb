class User < ActiveRecord::Base
  has_secure_password

  has_many :user_restaurants
  has_many :restaurants, through: :user_restaurants
  has_many :comments

  validates :email, uniqueness: true
end
