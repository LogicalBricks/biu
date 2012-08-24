class Lugar < ActiveRecord::Base
  attr_accessible :descripcion, :nombre, :resumen, :fotografias_attributes

  # Associations
  has_many :fotografias, as: :fotografiable, dependent: :destroy
  belongs_to :localidad

  accepts_nested_attributes_for :fotografias, allow_destroy: true
  # Validations
  validates :nombre, :resumen, :descripcion, presence: true
  validates :nombre, :resumen, length: {maximum: 255}
  validates :descripcion, length: {maximum: 2500}
end
