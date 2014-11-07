class Restaurant < ActiveRecord::Base
  has_many :user_restaurants
  has_many :customers, through: :user_restaurants, class_name: "User", source: :user
  has_many :comments
end
