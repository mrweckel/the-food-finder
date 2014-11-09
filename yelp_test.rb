require 'yelp'

Yelp.client.configure do |config|
  config.consumer_key = "aq8qpHMvqAgPVNXWnjqMkg"
  config.consumer_secret = "GMViPfhWCkLmZYIhdtL7gHdc8R8"
  config.token = "0E3aqR5Kgja_fG3qkuQBG7319sslYohw"
  config.token_secret = "9Byu3qnmpbi92pOe7BEcaMoPyOU"
end

response = Yelp.client.search('48 Wall St, New York, NY', { term: 'food', offset: 20, sort: 1, radius_filter: 800 })


 names = response.businesses
 # puts names


 names.each do |name|
  p name.reviews
  # p name.rating
end