require './config/environment'

class UsersController < ApplicationController

    get '/users/new' do
        erb :'users/new'
    end

    get '/users/:id' do
        @user = User.find(params[:id])
        erb :'users/show'
    end

    get '/users/:id/edit' do
        @user = User.find(params[:id])
        erb :'users/edit'
    end

    patch '/users/:id' do
        "Update User Changes"
    end

end