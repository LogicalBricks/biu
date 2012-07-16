class Fotografia < ActiveRecord::Base
  attr_accessible :imagen, :titulo, :descripcion
  mount_uploader :imagen, FotoUploader

  belongs_to :fotografiable, polymorphic: true
end
