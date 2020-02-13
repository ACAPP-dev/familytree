require './config/environment'

class UsersController < ApplicationController

    get '/users/new' do
        erb :'users/new'
    end

    get '/users/:id' do
        @user = User.find(params[:id])
        erb :'users/show'
    end

    post '/users' do
        user = User.create(params[:user])
        if user.valid?
            user.created_time_stamp = Time.now
            user.enabled = true
            user.save
            session[:user_id] = user.id
            flash[:message] = "User Successfully Created!"
            redirect '/families/new'
        else
            flash[:message] = "Error: Unable to create user.  Must have unique username and email address."
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