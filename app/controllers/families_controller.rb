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
        @family = Family.find(params[:id])
        erb :'families/show'
    end

    get '/families/:id/edit' do
        @family = Family.find(params[:id])
        erb :'families/edit'
    end

    patch '/families/:id' do

    end

    delete '/families/:id' do
        
    end



end