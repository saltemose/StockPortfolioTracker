class ApplicationController < Sinatra::Base
  require './config/environment'
  require 'rack-flash'

  class ApplicationController < Sinatra::Base

    configure do
      set :public_folder, 'public'
      set :views, 'app/views'

      enable :sessions
      use Rack::Flash
      set :session_secret, "password_security"
    end

    def current_user
      User.find_by(password_digest: session[:user_id])
    end
    def logged_in?
      # puts session.to_json
      session.key?(:user_id)
    end

    get '/' do
      erb :index
    end

  end
