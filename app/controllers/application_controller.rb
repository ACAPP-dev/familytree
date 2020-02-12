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
  
  get '/familytree/:id' do
    if Helpers.logged_in?(session)
      @user = Helpers.current_user(session)
      familymember_now = Familymember.find_by(id: params[:id])
      if familymember_now.family.users.any?{|user| user.id == @user.id} 
        @familymember = familymember_now
        @familytree = {}

        @familytree["parents"] = relationship_hash(@familymember)

        father_rel = @familymember.relationships.find_by(relation_type: "father")
        
        @familytree["paternal_grandparents"] = relationship_hash(father_rel.related_familymember) unless father_rel == nil

        mother_rel = @familymember.relationships.find_by(relation_type: "mother")
        @familytree["maternal_grandparents"] = relationship_hash(mother_rel.related_familymember) unless mother_rel == nil

        paternal_gpa_parents = father_rel.related_familymember.relationships.find_by(relation_type: "father") unless father_rel == nil
        @familytree["paternal_gpa_parents"] = relationship_hash(paternal_gpa_parents.related_familymember) unless paternal_gpa_parents == nil
        
        paternal_gma_parents = father_rel.related_familymember.relationships.find_by(relation_type: "mother") unless father_rel == nil
        @familytree["paternal_gma_parents"] = relationship_hash(paternal_gma_parents.related_familymember) unless paternal_gma_parents == nil

        maternal_gpa_parents = mother_rel.related_familymember.relationships.find_by(relation_type: "father") unless mother_rel == nil
        @familytree["maternal_gpa_parents"] = relationship_hash(maternal_gpa_parents.related_familymember) unless maternal_gpa_parents == nil
        
        maternal_gma_parents = mother_rel.related_familymember.relationships.find_by(relation_type: "mother") unless mother_rel == nil
        @familytree["maternal_gma_parents"] = relationship_hash(maternal_gma_parents.related_familymember) unless maternal_gma_parents == nil

        @familytree
        erb :familytree
      else
        redirect '/families'
      end
    else
      redirect '/login'
    end  
  end

  def relationship_hash(familymember_now)
    new_relation_hash = {}
    familymember_now.relationships.each do |relationship|
      new_relation_hash[relationship.relation_type] = relationship.related_familymember.first_name + 
      " " + relationship.related_familymember.last_name
    end
    new_relation_hash
  end

end
