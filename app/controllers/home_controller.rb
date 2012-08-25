class HomeController < ApplicationController
  def index
    @eventos = Evento.proximos
  end

  def lugares
    @lugares = Lugar.all
    @markers = @lugares[0..10].collect(&:localizacion).to_gmaps4rails
  end

  def lugares_all
    @lugares = Lugar.all
  end

end
