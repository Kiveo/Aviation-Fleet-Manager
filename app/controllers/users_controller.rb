class UsersController < ApplicationController

  # GET: /users/new
  get "/signup" do
    if !logged_in?
      erb :"/users/new"
    else
      redirect :"/planes"
    end
  end

  # POST: /users
  post "/users" do
    @prior_user = User.find_by(username: params[:username])
    if params[:username] == "" || params[:password] == ""
      redirect :"/signup"
    elsif @prior_user && params[:username] == @prior_user.username
      @error_message = "Username unavailable"
      erb :error
    else
      @user = User.create(username: params[:username], password: params[:password])
      session[:user_id] = @user.id
      redirect :"/users/#{current_user.slug}"
    end
  end

  # GET: /users/5
  get "/users/:slug" do
    @user = User.find_by_slug(params[:slug])
    erb :"/users/show"
  end

  #LOG IN request page
  get '/login' do
    erb :login
  end

  post '/login' do
    @user = User.find_by(username: params[:username], password: params[:password])
    session[:id] = @user.id
    redirect :"/users/#{current_user.slug}"
  end
  # LOG OUT: /users/5/delete
  get "/logout" do
    session.clear
    redirect "/"
  end

end
