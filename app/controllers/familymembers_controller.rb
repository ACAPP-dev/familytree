require './config/environment'

class FamilymembersController < ApplicationController
    
    get '/familymembers' do
        @user = User.find_by(id: session[:user_id])
        @familymembers = Familymember.all
        erb :'familymembers/index'
    end

    get '/familymembers/new' do
        @user = User.find_by(id: session[:user_id])
        @members = Familymember.all
        erb :'familymembers/new'
    end
    
    get '/familymembers/:id' do
        @user = User.find_by(id: session[:user_id])
        @familymember = Familymember.find(params[:id])
        erb :'familymembers/show'
    end

    get '/familymembers/family/:id' do
        #Show family members from selected family
        @user = User.find_by(id: session[:user_id])
        @family = Family.find_by(id: params[:id])
        @familymembers = @family.familymembers
        erb :'familymembers/index_by_family'
        #binding.pry

    end

    get '/familymembers/:id/edit' do
        @user = User.find_by(id: session[:user_id])
        @familymember = Familymember.find(params[:id])
        @family = Family.find_by(id: @familymember.family.id)
        @members = @family.familymembers
        @husband = @familymember.relationships.find{|relation| relation.relation_type == "husband"}
        @wife = @familymember.relationships.find{|relation| relation.relation_type == "wife"}
        @mother = @familymember.relationships.find{|relation| relation.relation_type == "mother"}
        @father = @familymember.relationships.find{|relation| relation.relation_type == "father"}
        #binding.pry
        erb :'familymembers/edit'
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
    
    patch '/familymembers/:id' do
        familymember = Familymember.find_by(id: params[:id])
        husband_object = familymember.relationships.find{|relation| relation.relation_type == "husband"}
        wife_object = familymember.relationships.find{|relation| relation.relation_type == "wife"}
        mother_object = familymember.relationships.find{|relation| relation.relation_type == "mother"}
        father_object = familymember.relationships.find{|relation| relation.relation_type == "father"}

        if familymember.update(params[:familymember])
            #binding.pry
            #update relationships
            if params[:relationships][0][:relation_type] == "husband" && params[:relationships][0].has_key?("related_familymember")
                #binding.pry
                if wife_object
                    index = familymember.relationships.find_index{|element| element[:relation_type] == "wife"}
                    familymember.relationships[index].delete
                    familymember.save
                end

                if !husband_object
                    rel = Relationship.new(relation_type: "husband")
                    rel.related_familymember = Familymember.find_by(id: params[:relationships][0][:related_familymember].to_i)
                    rel.save
                    familymember.relationships << rel
                    familymember.save
                elsif husband_object && husband_object.related_familymember.id != params[:relationships][0][:related_familymember].to_i
                    husband_object.related_familymember = Familymember.find_by(id: params[:relationships][0][:related_familymember].to_i)
                    husband_object.save
                    index = familymember.relationships.find_index{|element| element[:relation_type] == "husband"}
                    familymember.relationships[index].related_familymember = husband_object.related_familymember
                    familymember.save
                    #binding.pry
                end
            elsif 
                params[:relationships][0][:relation_type] == "wife" && params[:relationships][0].has_key?("related_familymember")
                #binding.pry
                if husband_object
                    #binding.pry
                    index = familymember.relationships.find_index{|element| element[:relation_type] == "husband"}
                    familymember.relationships[index].delete
                    familymember.save
                end

                if !wife_object
                    rel = Relationship.new(relation_type: "wife")
                    rel.related_familymember = Familymember.find_by(id: params[:relationships][0][:related_familymember].to_i)
                    rel.save
                    familymember.relationships << rel
                    familymember.save
                elsif wife_object && wife_object.related_familymember.id != params[:relationships][0][:related_familymember].to_i
                    wife_object.related_familymember = Familymember.find_by(id: params[:relationships][0][:related_familymember].to_i)
                    wife_object.save
                    index = familymember.relationships.find_index{|element| element[:relation_type] == "wife"}
                    familymember.relationships[index].related_familymember = wife_object.related_familymember
                    familymember.save
                    #binding.pry
                end
            else
                if husband_object
                    #binding.pry
                    index = familymember.relationships.find_index{|element| element[:relation_type] == "husband"}
                    familymember.relationships[index].delete
                    familymember.save
                    #husband_object.delete
                elsif wife_object
                    index = familymember.relationships.find_index{|element| element[:relation_type] == "wife"}
                    familymember.relationships[index].delete
                    familymember.save
                end
            
            end
            #binding.pry
            redirect "/familymembers/#{familymember.id}"
        else
            #future message that update failed
            redirect "/familymembers/#{familymember.id}/edit"
        end       
    end

    delete '/familymembers/:id' do
        "Delete Familymember"
    end

end