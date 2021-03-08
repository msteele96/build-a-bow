require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "BuildABow"
  end

  def current_user
    User.find_by(id: session[:user])
  end
    
  def logged_in?
    if session[:user].class == Integer
      true
    else
      false
    end
  end

  get "/" do
    erb :homepage
  end

end
