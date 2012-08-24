class HomeController < ApplicationController
  def index
    @eventos = Evento.proximos
  end

  def lugares
    @lugares = Lugar.all
  end

  def lugares_all
    @lugares = Lugar.all
  end

end
