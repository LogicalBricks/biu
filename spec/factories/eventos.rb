# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :evento do
    nombre 'un evento'
    resumen 'un resumen de evento'
    descripcion 'una descripción de evento'
    fecha_y_hora 1.day.from_now
  end
end
