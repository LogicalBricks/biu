class BusquedaController < ApplicationController
  # GET /eventos/buscar
  # GET /eventos/buscar.json
  def buscar
    @busqueda = params[:buscar]
    search = Evento.search do
      fulltext params[:buscar]
    end

    @eventos = search.results
    @markers_eventos = @eventos.collect(&:localizacion).to_gmaps4rails

    search = Lugar.search do
      fulltext params[:buscar]
    end

    @lugares = search.results
    @markers_lugares = @lugares.collect(&:localizacion).to_gmaps4rails
  end


end
