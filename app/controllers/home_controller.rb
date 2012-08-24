class HomeController < ApplicationController
  def index
    @eventos = Evento.proximos
  end
end
