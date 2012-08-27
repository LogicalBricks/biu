class Hotel < ActiveRecord::Base
  attr_accessible :clasificacion, :costo, :descripcion, :nombre, :resumen, :total_habitaciones

  # Associations
  belongs_to :localidad

  has_many :fotografias, as: :fotografiable, dependent: :destroy
  accepts_nested_attributes_for :fotografias, allow_destroy: true

  has_one :localizacion, as: :localizable, dependent: :destroy
  accepts_nested_attributes_for :localizacion, allow_destroy: true

  # Validations
  validates :nombre, :resumen, :descripcion, :total_habitaciones, :costo, :clasificacion, presence: true
  validates :nombre, :resumen, length: {maximum: 255}
  validates :descripcion, length: {maximum: 2500}
  validates :clasificacion, :total_habitaciones, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :costo, numericality: { greater_than_or_equal_to: 0 }
end
