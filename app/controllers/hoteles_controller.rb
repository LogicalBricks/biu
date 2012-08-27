class HotelesController < ApplicationController
  # GET /hoteles
  # GET /hoteles.json
  def index
    @hoteles = Hotel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hoteles }
    end
  end

  # GET /hoteles/1
  # GET /hoteles/1.json
  def show
    @hotel = Hotel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hotel }
    end
  end

  # GET /hoteles/new
  # GET /hoteles/new.json
  def new
    @hotel = Hotel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hotel }
    end
  end

  # GET /hoteles/1/edit
  def edit
    @hotel = Hotel.find(params[:id])
  end

  # POST /hoteles
  # POST /hoteles.json
  def create
    @hotel = Hotel.new(params[:hotel])

    respond_to do |format|
      if @hotel.save
        format.html { redirect_to @hotel, notice: 'Hotel was successfully created.' }
        format.json { render json: @hotel, status: :created, location: @hotel }
      else
        format.html { render action: "new" }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hoteles/1
  # PUT /hoteles/1.json
  def update
    @hotel = Hotel.find(params[:id])

    respond_to do |format|
      if @hotel.update_attributes(params[:hotel])
        format.html { redirect_to @hotel, notice: 'Hotel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hoteles/1
  # DELETE /hoteles/1.json
  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy

    respond_to do |format|
      format.html { redirect_to hoteles_url }
      format.json { head :no_content }
    end
  end
end
