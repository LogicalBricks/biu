class Localizacion < ActiveRecord::Base
  attr_accessible :latitude, :longitude
  acts_as_gmappable process_geocoding: false 
  belongs_to :localizable, polymorphic: true

  def gmaps4rails_infowindow 
    objeto = self.localizable
    link = "<a href='/#{objeto.class.name.downcase.pluralize}/#{objeto.id}'>#{objeto.nombre}</a>"
  end

  def gmaps4rails_marker_picture
    @icon = {
       hotel: 'http://logicalbricks.com/hotel_0star.png',
       evento: 'http://logicalbricks.com/comedyclub.png',
       lugar: 'http://logicalbricks.com/pyramid.png'
    }
    marker = {
      picture: @icon[self.localizable.class.name.downcase.to_sym],
      width: 32,
      height: 37
    }
    marker
  end
end
