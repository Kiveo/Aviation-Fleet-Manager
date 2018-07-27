require 'rack-flash'

class PlanesController < ApplicationController
  use Rack::Flash

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
    if params[:identifier] == " " || params[:model] == " "
      erb :"/planes/new"
    else
      @plane = Plane.create(identifier: params[:identifier], model: params[:model], serial_number: params[:serial_number], base: params[:base])
      current_user.planes << @plane
      @plane.save
      redirect :"/planes/#{@plane.slug}"
    end
  end

  # GET: /planes/N12345
  get "/planes/:slug" do
    @plane = Plane.find_by_slug(params[:slug])
    if logged_in?
       erb :"/planes/show"
     else
       redirect :"/login"
     end
    end

  # GET: /planes/N12345/edit
  get "/planes/:slug/edit" do
    if logged_in?
      @plane = Plane.find_by_slug(params[:slug])
      if @plane && current_user.planes.detect{|plane| plane == @plane }
        erb :"/planes/edit"
      else
        redirect :"/"
      end
    else
      redirect :"/"
    end
  end

  patch "/planes/:slug" do
    @plane = Plane.find_by_slug(params[:slug])
    if params[:identifier] == " " || params[:model] == " " || params[:serial_number] == " " || params[:base] == " "
      flash[:message] = "Fields must not be blank"
      erb :"planes/edit"
    else
      @plane.update(identifier: params[:identifier], model: params[:model], serial_number: params[:serial_number], base: params[:base])
      redirect "/planes/#{@plane.slug}"
    end
  end

  # DELETE: /planes/N12345/delete
  delete "/planes/:slug" do
    if logged_in?
      @plane = Plane.find_by_slug(params[:slug])
      if @plane && @plane.user == current_user
        @plane.delete
        flash[:message] = "Successfully deleted song."
      end
      redirect :"/"
    else
      redirect :"/login"
    end
  end

end
