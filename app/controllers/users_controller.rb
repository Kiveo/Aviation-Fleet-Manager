class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    erb :"/users/index.html"
  end

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
    if params[:username] == "" || params[:password] == ""
      redirect :"/signup"
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

  # LOG OUT: /users/5/delete
  get "/logout" do
    session.clear
    redirect "/"
  end

end
