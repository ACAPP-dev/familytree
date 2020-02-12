require './config/environment'

class FamiliesController < ApplicationController

    get '/families' do
        if Helpers.logged_in?(session)
            @user = Helpers.current_user(session)
            @families = []
            Family.all.each do |family|
                @families << family if family.users.any?{|user| user.id==@user.id}
            end    
            erb :'families/index'
        else
            redirect '/login'
        end
    end

    get '/families/new' do
        if Helpers.logged_in?(session)
            @user = Helpers.current_user(session)
            erb :'families/new'
        else
            redirect '/login'
        end
    end

    post '/families' do
        user_now = Helpers.current_user(session)
        if user_now
            new_family = user_now.families.build(params[:family])
            if new_family.valid?
                user_now.save
                redirect '/families'
            else
                #add message about failure to add new family
                redirect '/families/new'
            end
        else
            redirect '/login'
        end
    end

    get '/families/:id' do
        if Helpers.logged_in?(session)
            @user = Helpers.current_user(session)
            family_now = Family.find_by(id: params[:id])
            if family_now && family_now.users.any?{|user| user.id==@user.id}
                @family = family_now
                @family_users = []
                @family.users.each do |user|
                    @family_users << [user.username, user.first_name, user.last_name]
                end   
            else
                redirect '/families'
            end
            erb :'families/show'
        else
            redirect '/login'
        end
    end

    get '/families/:id/edit' do
        if Helpers.logged_in?(session)
            @user = Helpers.current_user(session)
            family_now = Family.find_by(id: params[:id])
            if family_now && family_now.users.any?{|user| user.id==@user.id}
                @family = family_now
                #future enhancement: add and remove users from family
                erb :'families/edit'
            else
                redirect "/families"
            end
        else
            redirect '/login'
        end
    end

    patch '/families/:id' do
        current_user = Helpers.current_user(session)
        if Helpers.logged_in?(session) && current_user
            @family = Family.find_by(id: params[:id])
            @family.update(params[:family])
            if @family.valid?
                redirect '/families'
            else
                #message that update failed?
                redirect "/families/#{@family.id}"
            end
        else
            redirect '/login'
        end
    end
    
    delete '/families/:id' do
        "Future Functionality to be added"
    end

end