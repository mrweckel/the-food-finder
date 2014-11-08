class Restaurant < ActiveRecord::Base
  has_many :ratings
  has_many :customers, through: :ratings, class_name: "User", source: :user

  has_many :comments

  def restaurant_array(user)

    customer_restaurants = user.restaurants.uniq
  end


end
