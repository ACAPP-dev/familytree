require './config/environment'

class FamiliesController < ApplicationController

    get '/families' do
        @families = Family.all
        @user = User.find_by(id: session[:user_id])
        erb :'families/index'
    end

    get '/families/new' do
        @user = User.find_by(id: session[:user_id])
        #verify logged in
        erb :'families/new'
    end

    post '/families' do
        #binding.pry
        user = User.find_by(id: session[:user_id])
        if user
            family = user.families.build(params[:family])
        else
            family = Family.create(params[:family])
        end
        if family.valid?
            family.save
            #add message about success creating new family
            redirect '/families'
        else
             #add message about failure to add new family
             redirect '/families/new'
        end
    end

    get '/families/:id' do
        @user = User.find_by(id: session[:user_id])
        @family = Family.find(params[:id])
        @family_users = []
        @family.users.each do |user|
            @family_users << [user.username, user.first_name, user.last_name]
        end
        #binding.pry
        erb :'families/show'
    end

    get '/families/:id/edit' do
        @user = User.find_by(id: session[:user_id])
        @family = Family.find(params[:id])
        #@family_users = []
        #@family.users.each do |user|
        #    @family_users << [user.username, user.first_name, user.last_name]
        #end
        erb :'families/edit'
    end

    patch '/families/:id' do
        @family = Family.find_by(id: params[:id])
        @family.update(params[:family])
        if @family.valid?
            redirect '/families'
        else
            #message that update failed?
            redirect "/families/#{@family.id}"
        end
    end
    
    delete '/families/:id' do
        
    end



end