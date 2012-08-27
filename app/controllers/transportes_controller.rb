class TransportesController < ApplicationController
  # GET /transportes
  # GET /transportes.json
  def index
    @transportes = Transporte.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transportes }
    end
  end

  # GET /transportes/1
  # GET /transportes/1.json
  def show
    @transporte = Transporte.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transporte }
    end
  end

  # GET /transportes/new
  # GET /transportes/new.json
  def new
    @transporte = Transporte.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transporte }
    end
  end

  # GET /transportes/1/edit
  def edit
    @transporte = Transporte.find(params[:id])
  end

  # POST /transportes
  # POST /transportes.json
  def create
    @transporte = Transporte.new(params[:transporte])

    respond_to do |format|
      if @transporte.save
        format.html { redirect_to @transporte, notice: 'Transporte was successfully created.' }
        format.json { render json: @transporte, status: :created, location: @transporte }
      else
        format.html { render action: "new" }
        format.json { render json: @transporte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transportes/1
  # PUT /transportes/1.json
  def update
    @transporte = Transporte.find(params[:id])

    respond_to do |format|
      if @transporte.update_attributes(params[:transporte])
        format.html { redirect_to @transporte, notice: 'Transporte was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transporte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transportes/1
  # DELETE /transportes/1.json
  def destroy
    @transporte = Transporte.find(params[:id])
    @transporte.destroy

    respond_to do |format|
      format.html { redirect_to transportes_url }
      format.json { head :no_content }
    end
  end
end
