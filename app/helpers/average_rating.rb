def average_rating(array)
 ratings_array = []

  if array.ratings.length > 0
    array.ratings.each do |rating|
      ratings_array.push(rating.rating)
    end
    (ratings_array.reduce(:+))/(ratings_array.length)
  else
    return "    " + "no ratings"
  end
end
