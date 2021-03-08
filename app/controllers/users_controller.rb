class UsersController < ApplicationController

  get '/users/login' do
    if logged_in?
      redirect "/users/#{current_user.username}"
    end
    erb :'users/login'
  end

  post '/users/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user] = @user.id
      redirect "/users/#{@user.username}"
    else
      redirect '/users/login'
    end
  end

  get '/users/signup' do
    erb :'users/signup'
  end

  post '/users/signup' do
    if params[:username] != "" && User.all.map{|user| user.username}.include?(params[:username]) == false && params[:password] != "" && params[:password] == params{:confirm_password}
        @user = User.create(username: params[:username], password: params[:password])
        session[:user] = @user.id
        redirect "/users/#{@user.username}"
    else
        redirect "/users/signup"
    end
  end

  get '/users/:username' do
    if logged_in?
        @user = current_user
        erb :'users/show'
    else
        redirect '/users/login'
    end
  end

  post '/users/logout' do
      session.clear
      redirect '/'
  end
    
end