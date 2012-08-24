class Lugar < ActiveRecord::Base
  attr_accessible :descripcion, :nombre, :resumen

  # Associations

  # Validations
  validates :nombre, :resumen, :descripcion, presence: true
  validates :nombre, :resumen, length: {maximum: 255}
  validates :descripcion, length: {maximum: 2500}
end
