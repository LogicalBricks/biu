class Transporte < ActiveRecord::Base
  attr_accessible :clasificacion, :descripcion, :horarios, :nombre, :resumen, :telefono

  # Associations
  belongs_to :localidad

  has_many :fotografias, as: :fotografiable, dependent: :destroy
  accepts_nested_attributes_for :fotografias, allow_destroy: true

  has_one :localizacion, as: :localizable, dependent: :destroy
  accepts_nested_attributes_for :localizacion, allow_destroy: true

  # Validations
  validates :nombre, :resumen, :descripcion, :clasificacion, presence: true
  validates :nombre, :resumen, length: {maximum: 255}
  validates :descripcion, length: {maximum: 2500}
  validates :clasificacion, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
