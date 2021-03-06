class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :rating, :inclusion => {:in => 1..5}

end
