get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/login' do
  user = User.find_by(email: params[:email]).try(:authenticate, params[:password])

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

get '/restaurant/:id' do |id|
  @restaurant = Restaurant.find(id)
  erb :restaurant
end

post '/comments/new' do

    redirect to('/home')
end

get '/logout' do
  session[:user_id] = nil
  redirect to('/')
end