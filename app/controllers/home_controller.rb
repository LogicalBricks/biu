class HomeController < ApplicationController
  def index
    @eventos = Evento.proximos
  end
  
  def calendario
    # Date is built from param
    @date = build_date_from params

    @eventos = Evento.del_mes @date
  end
  
  def lugares
    @lugares = Lugar.all
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
      month = value[:month]
      year  = value[:year]
      day   = 1
      "#{year}/#{month}/#{day}".to_date
    end
  end
end
