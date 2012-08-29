namespace :db do
  desc "Borrando y poblando la base de datos"
  task populate: :environment do
    require 'populator'
    require 'faker'

    Faker::Config.locale = 'es-mx'

    fotos_eventos_path = File.join(Rails.root, 'lib', 'fotos','eventos')
    fotos_eventos = Dir.glob(fotos_eventos_path + '/*')

    fotos_lugares_path = File.join(Rails.root, 'lib', 'fotos','lugares')
    fotos_lugares = Dir.glob(fotos_lugares_path + '/*')


    [Evento, Lugar, Fotografia, Localidad, Localizacion].each(&:delete_all)

    Localidad.populate 20 do |localidad|
      localidad.nombre = Populator.words(1..5).titleize
    end

    Evento.populate 500 do |evento|
      evento.nombre = Faker::Event.name 
      evento.lugar = Populator.words(1..5)
      evento.resumen = Populator.sentences(5..8)
      evento.descripcion= Populator.paragraphs(1..3)
      evento.fecha_y_hora = 3.months.ago..5.months.from_now
      evento.costo = [ 100.00, 500.00, 1000.00, 300.00, 400.00, 0.00 ]
      rand(2..5).times do
        foto = Fotografia.new
        foto.imagen = File.open(fotos_eventos.sample)

        foto.titulo = Populator.words(1..5)
        foto.descripcion = Populator.sentences(1..5)
        foto.fotografiable_id = evento.id
        foto.fotografiable_type = "Evento"
        foto.save!
      end
      localizacion = Localizacion.new
      latlong = random_latitude_longitude()
      localizacion.latitude = latlong['lat']

      localizacion.longitude = latlong['long']
      localizacion.localizable_id = evento.id
      localizacion.localizable_type = "Evento"
      localizacion.save!
    end 

    Lugar.populate 50 do |lugar|
      lugar.nombre = Faker::Place.name
      lugar.resumen = Populator.sentences(5..8)
      lugar.descripcion= Populator.paragraphs(1..3)
      lugar.localidad_id = Localidad.pluck(:id)
      rand(2..5).times do
        foto = Fotografia.new
        foto.imagen = File.open(fotos_lugares.sample)

        foto.titulo = Populator.words(1..5)
        foto.descripcion = Populator.sentences(1..3)
        foto.fotografiable_id = lugar.id
        foto.fotografiable_type = "Lugar"
        foto.save!
      end
      localizacion = Localizacion.new
      latlong = random_latitude_longitude()
      localizacion.latitude = latlong['lat']

      localizacion.longitude = latlong['long']
      localizacion.localizable_id = lugar.id
      localizacion.localizable_type = "Lugar"
      localizacion.save!

    end 

    Hotel.populate 50 do |hotel|
      hotel.nombre = Populator.words(1..5).titleize
      hotel.resumen = Populator.sentences(1..5)
      hotel.telefono = Populator.words(3)
      hotel.clasificacion = [1, 2, 3, 4, 5]
      hotel.localidad_id = Localidad.pluck(:id)
    end

    Restaurante.populate 50 do |restaurante|
      restaurante.nombre = Populator.words(1..5).titleize
      restaurante.resumen = Populator.sentences(1..5)
      restaurante.telefono = Populator.words(3)
      restaurante.clasificacion = [1, 2, 3, 4, 5]
      restaurante.localidad_id = Localidad.pluck(:id)
    end

    Transporte.populate 50 do |transporte|
      transporte.nombre = Populator.words(1..5).titleize
      transporte.resumen = Populator.sentences(1..5)
      transporte.telefono = Populator.words(3)
      transporte.horarios = Populator.sentences(5...10)
      transporte.clasificacion = [1, 2, 3, 4, 5]
      transporte.localidad_id = Localidad.pluck(:id)
    end

    Emergencia.populate 50 do |emergencia|
      emergencia.nombre = Populator.words(1..5).titleize
      emergencia.resumen = Populator.sentences(1..5)
      emergencia.telefono = Populator.words(3)
      emergencia.localidad_id = Localidad.pluck(:id)
    end

  end

  def random_latitude_longitude 
    latlong = {}
    latitude_width =18.312810846425442 - 15.62832697885264
    latlong['lat'] = (rand() * latitude_width) + 15.62832697885264

    longitude_width = -94.1363525390625 - -98.4649658203125 
    latlong['long'] = longitude_random = (rand() * latitude_width) + -98.4649658203125
    latlong
  end    

end
