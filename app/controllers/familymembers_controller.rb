require './config/environment'

class FamilymembersController < ApplicationController
    
    get '/familymembers' do
        @user = User.find_by(id: session[:user_id])
        @familymembers = Familymember.all
        erb :'familymembers/index'
    end

    get '/familymembers/new' do
        @members = Familymember.all
        erb :'familymembers/new'
    end
    
    post '/familymembers' do
        family_object = Family.find_by(surname: "Capp")
        a = Familymember.new(params[:familymember])
        a.family = family_object
        #binding.pry
        params[:relationships].each do |relationship|
          #binding.pry
          if relationship[:relation_type] != "none" && relationship.has_key?("related_familymember")
            related_familymember_object = Familymember.find(relationship[:related_familymember])
            rel = Relationship.new(relation_type: relationship[:relation_type])
            rel.related_familymember = related_familymember_object
            rel.save
            a.relationships << rel
          end
        end
        a.save
        redirect "/familymembers/#{a.id}"
    end
    
    get '/familymembers/:id' do
        @familymember = Familymember.find(params[:id])
        erb :'familymembers/show'
    end

    get '/familymembers/family/:id' do
        "Set up view showing family members from specific family"

    end

    get '/familymembers/:id/edit' do
        @familymember = Familymember.find(params[:id])
        erb :'familymembers/edit'
    end

    patch '/familymember/:id' do
        "Update Familymember"
    end

    delete '/familymember/:id' do
        "Delete Familymember"
    end

end