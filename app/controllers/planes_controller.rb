class PlanesController < ApplicationController

  # GET: /planes
  get '/planes' do
    @planes = Plane.all
    erb :'planes/show'
  end

  # GET: /planes/new
  get "/planes/new" do
    if logged_in?
      erb :"/planes/new"
    else
      redirect :"/"
    end
  end

  # POST: /planes
  post "/planes" do
    if params[:identifier] == "" || params[:model] == ""
      redirect :"/planes/new"
    else
      @plane = Plane.create(identifier: params[:identifier], model: params[:model], serial_number: params[:serial_number], base: params[:base])
      redirect "/planes"
    end
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
