require './config/environment'

class UsersController < ApplicationController

    get '/users/new' do
        erb :'users/new'
    end

    get '/users/:id' do
        @user = User.find(params[:id])
        erb :'users/show'
    end

    post '/users' dod
        user = User.create(params[:user])
        if user.valid?
            user.created_time_stamp = Time.now
            user.enabled = true
            user.save
            session[:user_id] = user.id
            #add message, user created successfully
            redirect '/families/new'
        else
            #add message, missing a required field (first name, username, password, or email)
            redirect '/users/new'
        end

    end

    get '/users/:id/edit' do
        @user = User.find(params[:id])
        erb :'users/edit'
    end

    patch '/users/:id' do
        #Future Updates
    end

end