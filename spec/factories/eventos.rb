# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :evento do
    nombre 'un evento'
    resumen 'un resumen'
    descripcion 'una descripción'
    fecha_y_hora 1.day.from_now
  end
end
