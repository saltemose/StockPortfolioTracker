class ApplicationController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

  enable :sessions
  set :seesion_secret, "secret"

  get '/' do
    erb :index
  end
end
