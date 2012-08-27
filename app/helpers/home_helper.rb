module HomeHelper
  def link_to_next_month date
    date = date.next_month
    link_to build_month_name(date), build_calendario_path(date)
  end

  def link_to_previous_month date
    date = date.prev_month
    link_to build_month_name(date), build_calendario_path(date)
  end

  def build_month_name date
    l date, format: :nombre_mes
  end

  def build_calendario_path date
    "/calendario/#{date.year}/#{date.month}"
  end
end
