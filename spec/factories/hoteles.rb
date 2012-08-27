# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :hotel do
    nombre "MyString"
    resumen "MyString"
    descripcion "MyText"
    clasificacion 1
    total_habitaciones 1
    localidad nil
    costo "9.99"
    telefono "MyString"
  end
end
