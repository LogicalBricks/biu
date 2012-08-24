# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :lugar do
    nombre 'un lugar'
    resumen 'un resumen de lugar'
    descripcion 'una descripción de lugar'
    fecha_y_hora 1.day.from_now
  end
end
