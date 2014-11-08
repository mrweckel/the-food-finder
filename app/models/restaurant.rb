class Restaurant < ActiveRecord::Base
  has_many :ratings
  has_many :customers, through: :ratings, class_name: "User", source: :user

  has_many :comments
end
