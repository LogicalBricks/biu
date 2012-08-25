class Localizacion < ActiveRecord::Base
  attr_accessible :latitude, :longitude
  acts_as_gmappable process_geocoding: false 
  belongs_to :localizable, polymorphic: true
end
