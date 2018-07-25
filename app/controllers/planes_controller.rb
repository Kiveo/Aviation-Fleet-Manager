class PlanesController < ApplicationController

  # GET: /planes
  get '/planes' do
    @planes = Plane.all
    erb :'planes/index'
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
      current_user.planes << @plane
      redirect :"/planes/#{@plane.identifier}"
    end
  end

  # GET: /planes/N12345
  get "/planes/:identifier" do
     if logged_in?
       @plane = Plane.find_by(identifier: params[:identifier])
       erb :"/planes/show"
     else
       redirect :"/login"
     end
   end

  # GET: /planes/N12345/edit
  get "/planes/:identifier/edit" do
    if logged_in?
      @plane = Plane.find_by(identifier: params[:identifier])
      if @plane && current_user.planes.detect{|plane| plane }
        erb :"/planes/edit"
      else
        redirect :"/"
      end
    else
      redirect :"/"
    end
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
