class Localidad < ActiveRecord::Base
  attr_accessible :nombre

  # Association
  has_many :lugares
  has_many :hoteles
  has_many :restaurantes
  has_many :transportes
end
