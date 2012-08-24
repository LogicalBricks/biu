namespace :db do
  desc "Borrando y poblando la base de datos"
  task populate: :environment do
    require 'populator'
    require 'faker'
    
    [Evento, Lugar, Fotografia, Localidad, Localizacion].each(&:delete_all)
 
    Evento.populate 500 do |evento|
      evento.nombre = Populator.words(1..3).titleize
      evento.resumen = Populator.sentences(5..8)
      evento.descripcion= Populator.paragraphs(1..3)
      evento.fecha_y_hora = 5.months.ago..1.year.from_now
      evento.costo = [ 100.00, 500.00, 1000.00, 300.00, 400.00, 0.00 ]
    end 

  end
end
