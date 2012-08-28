class EventosController < ApplicationController
  # GET /eventos
  # GET /eventos.json
  def index
    @eventos = Evento.all
   
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @eventos }
    end
  end

  # GET /eventos/1
  # GET /eventos/1.json
  def show
    @evento = Evento.find(params[:id])
    @marker = {
      map_options: {
        auto_zoom: false,
        zoom: 15,
        center_latitude: @evento.localizacion.latitude,
        center_longitude: @evento.localizacion.longitude
      },
      markers: {
        data: @evento.localizacion.to_gmaps4rails
      }
    }
    #@marker = @evento.localizacion.to_gmaps4rails

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @evento }
    end
  end

  # GET /eventos/new
  # GET /eventos/new.json
  def new
    @evento = Evento.new
    @evento.localizacion = Localizacion.new
    @marker = []
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @evento }
    end
  end

  # GET /eventos/1/edit
  def edit
    @evento = Evento.find(params[:id])
    @marker = @evento.localizacion.to_gmaps4rails
  end

  # POST /eventos
  # POST /eventos.json
  def create
    @evento = Evento.new(params[:evento])

    respond_to do |format|
      if @evento.save
        format.html { redirect_to @evento, notice: 'El Evento fue guardado correctamente.' }
        format.json { render json: @evento, status: :created, location: @evento }
      else
        @marker = []
        format.html { render action: "new" }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /eventos/1
  # PUT /eventos/1.json
  def update
    @evento = Evento.find(params[:id])

    respond_to do |format|
      if @evento.update_attributes(params[:evento])
        format.html { redirect_to @evento, notice: 'El Evento fue guardado correctamente.' }
        format.json { head :no_content }
      else
        @marker = @evento.localizacion.to_gmaps4rails
        format.html { render action: "edit" }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventos/1
  # DELETE /eventos/1.json
  def destroy
    @evento = Evento.find(params[:id])
    @evento.destroy

    respond_to do |format|
      format.html { redirect_to eventos_url }
      format.json { head :no_content }
    end
  end

end
