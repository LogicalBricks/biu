namespace :db do
  desc "Borrando y poblando la base de datos"
  task populate: :environment do
    require 'populator'
    require 'faker'

    fotos_path = File.join(Rails.root, 'lib', 'fotos')
    fotos = Dir.glob(fotos_path+'/*')

    
    [Evento, Lugar, Fotografia, Localidad, Localizacion].each(&:delete_all)
 
    Evento.populate 500 do |evento|
      evento.nombre = Populator.words(1..3).titleize
      evento.resumen = Populator.sentences(5..8)
      evento.descripcion= Populator.paragraphs(1..3)
      evento.fecha_y_hora = 5.months.ago..1.year.from_now
      evento.costo = [ 100.00, 500.00, 1000.00, 300.00, 400.00, 0.00 ]
      2.times do
        foto = Fotografia.new
        foto.imagen = File.open(fotos.sample)

        foto.titulo = Populator.words(1..3)
        foto.descripcion = Populator.sentences(1..3)
        foto.fotografiable_id = evento.id
        foto.fotografiable_type = "Evento"
        foto.save!
      end
    end 

  end
end
