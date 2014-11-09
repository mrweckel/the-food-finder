class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  # validates_numericality_of :rating, :in => 1..5

end
