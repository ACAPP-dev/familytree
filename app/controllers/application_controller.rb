require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  get "/familymembers/new" do
    @members = Familymember.all
    erb :new
  end

  post "/familymembers" do
    a = Familymember.new(first_name: params[:first_name], last_name: params[:last_name], gender: params[:gender])
    a.save
    redirect "/familymembers/#{a.id}"
  end

  get "/familymembers/:id" do
    "Show individual family member"
  end

end
