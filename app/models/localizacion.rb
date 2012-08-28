class Localizacion < ActiveRecord::Base
  attr_accessible :latitude, :longitude
  acts_as_gmappable process_geocoding: false 
  belongs_to :localizable, polymorphic: true

  def gmaps4rails_infowindow 
    objeto = self.localizable
    link = "<a href='/#{objeto.class.name.downcase.pluralize}/#{objeto.id}'>#{objeto.nombre}</a>"
  end
end
