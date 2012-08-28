class EmergenciasController < ApplicationController
  # GET /emergencias
  # GET /emergencias.json
  def index
    @emergencias = Emergencia.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @emergencias }
    end
  end

  # GET /emergencias/1
  # GET /emergencias/1.json
  def show
    @emergencia = Emergencia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @emergencia }
    end
  end

  # GET /emergencias/new
  # GET /emergencias/new.json
  def new
    @emergencia = Emergencia.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @emergencia }
    end
  end

  # GET /emergencias/1/edit
  def edit
    @emergencia = Emergencia.find(params[:id])
  end

  # POST /emergencias
  # POST /emergencias.json
  def create
    @emergencia = Emergencia.new(params[:emergencia])

    respond_to do |format|
      if @emergencia.save
        format.html { redirect_to @emergencia, notice: 'Emergencia was successfully created.' }
        format.json { render json: @emergencia, status: :created, location: @emergencia }
      else
        format.html { render action: "new" }
        format.json { render json: @emergencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /emergencias/1
  # PUT /emergencias/1.json
  def update
    @emergencia = Emergencia.find(params[:id])

    respond_to do |format|
      if @emergencia.update_attributes(params[:emergencia])
        format.html { redirect_to @emergencia, notice: 'Emergencia was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @emergencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emergencias/1
  # DELETE /emergencias/1.json
  def destroy
    @emergencia = Emergencia.find(params[:id])
    @emergencia.destroy

    respond_to do |format|
      format.html { redirect_to emergencias_url }
      format.json { head :no_content }
    end
  end
end
