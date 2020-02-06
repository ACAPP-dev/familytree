require './config/environment'

class FamiliesController < ApplicationController

    get '/families' do
        @families = Family.all 
        erb :'families/index'
    end

    get '/families/new' do
        erb :'families/new'
    end

    post '/families' do

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