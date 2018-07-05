class StockController < ApplicationController

    get '/stocks/new' do
      if logged_in?
        erb :'/stocks/create_stock'
      else
        redirect :'/login'
      end
    end

    post '/stocks' do
      if params[:content].empty?

        redirect :'/stocks/new'
      else
        @stock = Stock.create(params)
        @stock.user_id = session[:user_id]
        @stock.save
        redirect :"stocks/#{@stock.id}"
      end
    end

    get '/stocks/:id' do
      if logged_in?
        @stock = Stock.find_by_id(params[:id])
        erb :'/stocks/show_stock'
      else
        redirect :'/login'
      end
    end

    get '/stocks/:id/edit' do
      if logged_in?
        @stock = Stock.find(params[:id])
        if @stock && session[:user_id] == @stock.user_id
          erb :'/stocks/edit_stock'
        else
          redirect :'/index'
        end
      else
        redirect :"/login"
      end
    end

    patch '/stocks/:id' do

    end

  end
