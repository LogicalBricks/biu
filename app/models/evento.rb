class Evento < ActiveRecord::Base
  attr_accessible :costo, :descripcion, :fecha_y_hora, :nombre, :resumen, :fotografias_attributes

  # Associations
  has_many :fotografias, as: :fotografiable, dependent: :destroy
  belongs_to :localidad

  accepts_nested_attributes_for :fotografias, allow_destroy: true

  # Validations
  validates :nombre, :resumen, :descripcion, :fecha_y_hora, presence: true
  validates :nombre, :resumen, length: {maximum: 255}
  validates :descripcion, length: {maximum: 2500}

  # Scopes
  scope :proximos, where('fecha_y_hora >= ? AND fecha_y_hora < ?', Time.now, 2.weeks.from_now).order(:fecha_y_hora)


  # Methods
  def self.del_mes date = nil
    date ||= Date.today
    f_inicio = date.beginning_of_month
    f_fin = date.next_month.beginning_of_month

    aux = scoped
    aux.where('fecha_y_hora >= ? AND fecha_y_hora < ?', f_inicio, f_fin).order(:fecha_y_hora)
  end
end
