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

  get "/familymembers" do
    @families = Family.all
    @familymembers = Familymember.all
    @relations = Relationship.all
    #@relation_join = FamilymemberRelationship.all
    erb :index
  end

  post "/familymembers" do
    family_object = Family.find_by(surname: "Capp")
    a = Familymember.new(first_name: params[:familymember][:first_name],
      last_name: params[:familymember][:last_name],
      gender: params[:familymember][:gender])
    a.family = family_object
   # binding.pry
    params[:familymember][:relationships].each do |relationship|
      #binding.pry
      related_familymember_object = Familymember.find(relationship[:related_familymember])
      rel = Relationship.new(relation_type: relationship[:relation_type])
      rel.related_familymember = related_familymember_object
      rel.save
      a.relationships << rel
    end
    a.save
    redirect "/familymembers/#{a.id}"
  end

  get "/familymembers/:id" do
    "Show individual family member"
  end

end
