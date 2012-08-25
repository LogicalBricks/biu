class HomeController < ApplicationController
  def index
    @eventos = Evento.proximos
  end
  
  def calendario
    # Date is built from param
    month = params[:month].blank? ? Date.today.month : params[:month]
    year = params[:year].blank? ? Date.today.year : params[:year]
    day = 1
    @date = "#{year}/#{month}/#{day}".to_date

    if params[:month].nil? and params[:year].nil?
      @eventos = Evento.del_mes
    else
      @eventos = Evento.del_mes @date
    end
  end
  
  def lugares
    @lugares = Lugar.all
  end

  def lugares_all
    @lugares = Lugar.all
  end
end
