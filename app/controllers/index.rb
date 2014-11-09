get '/' do
  erb :index
end

post '/login' do
  user = User.find_by(email: params[:email])
    if user
      session[:user_id] = user.id
      redirect to('/home')
    else
      redirect to '/'
    end
end

get '/signup' do
  erb :signup
end

post '/signup' do
  user = User.new(params[:user])

  if user.save
    session[:user_id] = user.id
    redirect to('/home')
  else
    redirect to('/signup')
  end
end

get '/home' do
  @user = User.find(session[:user_id])

  @restaurants = Restaurant.all
  erb :home
end

get '/restaurants/all' do
  @restaurants = Restaurant.all
  erb :restaurants_all
end

get '/restaurant/:id' do |id|
  @restaurant = Restaurant.find(id)
  erb :restaurant_single
end

post '/comments/new' do
  comment = Comment.new(params[:comment])
  if comment.save
    redirect to("/restaurant/#{comment.restaurant.id}")
  else
    redirect to("/restaurant/#{comment.restaurant.id}")
  end
end

get '/profile/:id' do |id|
  @user = User.find(id)
  erb :profile_single
end

get '/profiles/all' do
  @users = User.all
  @url = Gravatar.new("generic@example.com").image_url
  erb :profile_all
end


get '/logout' do
  session[:user_id] = nil
  redirect to('/')
end

post '/rating' do
end
