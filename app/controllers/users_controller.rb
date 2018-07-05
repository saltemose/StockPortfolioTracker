class UsersController < ApplicationController

  get '/users' do
     if logged_in?
       @users = User.all
       erb :'/index'
     else
       erb :'/users/login'
     end
   end

   get '/login' do
     if logged_in?
      redirect :"/users"
    else
      erb :'/users/login'
    end
   end

   post '/login' do
     if params[:username].empty? || params[:password].empty?
       erb :'/users/login'
     else
       @user = User.find_by(username: params[:username])
       if @user && @user.authenticate(params[:password])
         session[:user_id] = @user.id
         redirect :'/users'
       else
         session.clear
         erb :'/users/login'
       end
     end
   end

   get '/signup' do
     if logged_in?
       redirect :'/users'
     else
       erb :'/users/create_user'
     end
   end

   post '/signup' do

     if params[:username].empty? || params[:email].empty? || params[:password].empty?
       redirect :'/signup'
     elsif User.find_by(username: params[:username])
       redirect :"/signup"
     elsif User.find_by(email: params[:email])
       redirect :'/signup'
     else
       @user = User.create(params)
       session[:user_id] = @user.id
       redirect :'/users'
     end
   end

   get '/logout' do
     if logged_in?
       session.clear
       flash[:message] = "Successfully logged out."
       redirect :'/login'
     else
       redirect :'/'
     end
   end

 end
