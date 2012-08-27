class HomeController < ApplicationController
  def index
    @eventos = Evento.proximos
    @markers = @eventos.collect(&:localizacion).to_gmaps4rails
  end
  
  def calendario
    # Date is built from param
    @date = build_date_from params

    @eventos = Evento.del_mes @date
  end
  
  def lugares
    @lugares = Lugar.all
    @markers = @lugares.collect(&:localizacion).to_gmaps4rails
  end

  def lugares_all
    @lugares = Lugar.all
  end

  ##############################
  private
  ##############################

  def build_date_from value
    if value[:month].blank? or value[:year].blank?
      Date.today
    else
      "#{value[:year]}/#{value[:month]}/1".to_date
    end
  end
end
