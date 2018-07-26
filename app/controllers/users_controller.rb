class UsersController < ApplicationController

  # New User signup
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
    if params[:username] == " " || params[:password] == " "
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

  # GET: /users/user-name
  get "/users/:slug" do
    if logged_in?
      @user = User.find_by_slug(params[:slug])
      erb :"/users/show"
    else
      redirect :"/login"
    end
  end

  #LOG IN request page
  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to '/'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect :"/users/#{current_user.slug}"
    else
      @error_message = "Incorrect Login Info"
      erb :'/error'
    end
  end

  # Sign Out
  get "/logout" do
    session.clear
    redirect "/"
  end

end
