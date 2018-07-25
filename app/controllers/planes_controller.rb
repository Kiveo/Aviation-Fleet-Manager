class PlanesController < ApplicationController

  # GET: /planes
  get '/planes' do
    if logged_in?
      @planes = Plane.all
      erb :'planes/show'
    else
      redirect to '/login'
    end
  end

  # GET: /planes/new
  get "/planes/new" do
    erb :"/planes/new"
  end

  # POST: /planes
  post "/planes" do
    redirect "/planes"
  end

  # GET: /planes/5
  get "/planes/:id" do
    erb :"/planes/show.html"
  end

  # GET: /planes/5/edit
  get "/planes/:id/edit" do
    erb :"/planes/edit.html"
  end

  # PATCH: /planes/5
  patch "/planes/:id" do
    redirect "/planes/:id"
  end

  # DELETE: /planes/5/delete
  delete "/planes/:id/delete" do
    redirect "/planes"
  end
end
