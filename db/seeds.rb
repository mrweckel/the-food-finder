User.create(name: "Edwin", email: "emoney86@gmail.com", password_digest: "123")
User.create(name: "AJ", email: "identity_unveiled@hotmail.com", password_digest: "123")
User.create(name: "Baron", email: "baron.willeford@gmail.com", password_digest: "123")
User.create(name: "Matt", email: "mrweckel@gmail.com", password_digest: "123")
User.create(name: "Courtney", email: "cnilan@gmail.com", password_digest: "123")
User.create(name: "Ed", email: "edchen001@gmail.com", password_digest: "123")
User.create(name: "James", email: "jhwang90@gmail.com", password_digest: "123")
User.create(name: "Jensen", email: "jensen.bouzi@gmail.com", password_digest: "123")
User.create(name: "Mark", email: "markdmcq@gmail.com", password_digest: "123")
User.create(name: "Rob", email: "rob.yang@gmail.com", password_digest: "123")
User.create(name: "Viktor", email: "vnikiten01@gmail.com", password_digest: "123")
User.create(name: "Xiran", email: "xiranou@gmail.com", password_digest: "123")


Yelp.client.configure do |config|
  config.consumer_key = "aq8qpHMvqAgPVNXWnjqMkg"
  config.consumer_secret = "GMViPfhWCkLmZYIhdtL7gHdc8R8"
  config.token = "0E3aqR5Kgja_fG3qkuQBG7319sslYohw"
  config.token_secret = "9Byu3qnmpbi92pOe7BEcaMoPyOU"
end

response = Yelp.client.search('48 Wall St, New York, NY', { term: 'food', sort: 1, limit:19, radius_filter: 800 })

names = response.businesses

names.each do |name|
    Restaurant.create(name: name.name, picture: name.image_url)
end

rating_array=[1,2,3,4,5]

100.times do
  Rating.create(user_id: User.all.sample.id, restaurant_id: Restaurant.all.sample.id, rating: rating_array.sample)
end
