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

  # POST: /users
  post "/users" do
    if params[:username] == "" || params[:password] == ""
      redirect :"/signup"
    else
      @user = User.create(:user)
      session[:id] = @user.id
      redirect :"/users/show"
    end
  end

  # GET: /users/5
  get "/users/:slug" do
    @user = User.find_by_slug(params[:slug])
    erb :"/users/show"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
