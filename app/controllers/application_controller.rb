require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    @user = Helpers.current_user(session)
    erb :index
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect '/families'
    else
      #message that login failed?
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end
  
  get '/familytree1' do
    @familymember = Familymember.find_by(first_name: "Andrew")
    @familytree = {}

    @familytree["parents"] = relationship_hash(@familymember)

    father = @familymember.relationships.find_by(relation_type: "father").related_familymember

    @familytree["paternal_grandparents"] = relationship_hash(father)

    mother = @familymember.relationships.find_by(relation_type: "mother").related_familymember

    @familytree["maternal_grandparents"] = relationship_hash(mother)

    #binding.pry
    #@familymember.relationships.each do |relationship|
      #binding.pry
     # @familytree[relationship.relation_type] = relationship.related_familymember.first_name + 
      #  " " + relationship.related_familymember.last_name
       # if relationship.relation_type == "father"
        #  new_relation = Familymember.find_by(id: relationship.related_familymember.id)
         # relationship_hash(new_relation)
        #end
   # end
    erb :familytree1
  end

  def relationship_hash(familymember_now)
    new_relation_hash = {}
    familymember_now.relationships.each do |relationship|
      #binding.pry

      new_relation_hash[relationship.relation_type] = relationship.related_familymember.first_name + 
      " " + relationship.related_familymember.last_name

    end
    #binding.pry
    new_relation_hash
  end

  def mother(familymember_now)

  end
end
