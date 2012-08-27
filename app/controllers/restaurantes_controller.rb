class RestaurantesController < ApplicationController
  # GET /restaurantes
  # GET /restaurantes.json
  def index
    @restaurantes = Restaurante.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @restaurantes }
    end
  end

  # GET /restaurantes/1
  # GET /restaurantes/1.json
  def show
    @restaurante = Restaurante.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @restaurante }
    end
  end

  # GET /restaurantes/new
  # GET /restaurantes/new.json
  def new
    @restaurante = Restaurante.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @restaurante }
    end
  end

  # GET /restaurantes/1/edit
  def edit
    @restaurante = Restaurante.find(params[:id])
  end

  # POST /restaurantes
  # POST /restaurantes.json
  def create
    @restaurante = Restaurante.new(params[:restaurante])

    respond_to do |format|
      if @restaurante.save
        format.html { redirect_to @restaurante, notice: 'Restaurante was successfully created.' }
        format.json { render json: @restaurante, status: :created, location: @restaurante }
      else
        format.html { render action: "new" }
        format.json { render json: @restaurante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /restaurantes/1
  # PUT /restaurantes/1.json
  def update
    @restaurante = Restaurante.find(params[:id])

    respond_to do |format|
      if @restaurante.update_attributes(params[:restaurante])
        format.html { redirect_to @restaurante, notice: 'Restaurante was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @restaurante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurantes/1
  # DELETE /restaurantes/1.json
  def destroy
    @restaurante = Restaurante.find(params[:id])
    @restaurante.destroy

    respond_to do |format|
      format.html { redirect_to restaurantes_url }
      format.json { head :no_content }
    end
  end
end
