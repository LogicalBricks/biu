class HomeController < ApplicationController
  def index
    @eventos = Evento.proximos
  end
  
  def calendario
    month = params[:month].blank? ? Date.today.month : params[:month]
    year = params[:year].blank? ? Date.today.year : params[:year]
    day = 1
    date = "#{year}/#{month}/#{day}".to_date

    @last_month = "#{date.prev_month.year}/#{date.prev_month.month}"
    @next_month = "#{date.next_month.year}/#{date.next_month.month}"

    if params[:month].nil? and params[:year].nil?
      @eventos = Evento.del_mes
    else
      @eventos = Evento.where(
        'fecha_y_hora >= ? AND fecha_y_hora < ?', 
        date.beginning_of_month, 
        date.next_month.beginning_of_month
      ).order(:fecha_y_hora)
    end
    @year = date.year
    @month = date.month
  end
  
  def lugares
    @lugares = Lugar.all
    @markers = @lugares[0..10].collect(&:localizacion).to_gmaps4rails
  end

  def lugares_all
    @lugares = Lugar.all
  end
end
