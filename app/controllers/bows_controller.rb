class BowsController < ApplicationController

    
    get '/bows/new' do
        if logged_in?
            @user = current_user
            erb :'bows/new'
        else
            redirect '/users/login'
        end
    end

    post '/bows/new' do
        if logged_in? && params[:name] != "" && params[:model] != ""
            @bow = Bow.create(params)
            @bow.user_id = current_user.id
            @bow.save
            redirect "/bows/#{@bow.id}"
        else
            redirect "/users/#{current_user.username}"
        end
    end

    get '/bows/:id' do
        if logged_in?
            @bow = Bow.find_by(id: params[:id])
            @user = current_user
            erb :'bows/show'
        else
            redirect '/users/login'
        end
    end

    delete '/bows/:id/delete' do
        @bow = Bow.find_by(id: params[:id])
        if logged_in? && current_user.id == @bow.user_id
            @bow.delete
        end
        redirect "/users/#{current_user.id}"
    end

    get '/bows/:id/edit' do
        @bow = Bow.find_by(id: params[:id])
        @user = current_user
        if logged_in?
            erb :'bows/edit'
        else
            redirect '/users/login'
        end
    end

    patch '/bows/:id/edit' do
        @bow = Bow.find_by(id: params[:id])
        if logged_in? && current_user.id == @bow.user_id
            @bow.update(params[:bow])
        end
        redirect "/bows/#{@bow.id}"
    end

end