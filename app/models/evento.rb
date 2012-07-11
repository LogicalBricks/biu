class Evento < ActiveRecord::Base
  attr_accessible :costo, :descripcion, :fecha_y_hora, :nombre, :resumen

  has_many :fotografias, as: :fotografiable, dependent: :destroy

  accepts_nested_attributes_for :fotografias, allow_destroy: true
end
