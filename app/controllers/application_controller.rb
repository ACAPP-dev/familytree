require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    @user = User.find_by(id: session[:user_id])
    erb :index
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    #binding.pry
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect '/families'
    else
      #message that login failed
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end
end
