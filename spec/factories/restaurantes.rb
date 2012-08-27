# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :restaurante do
    nombre "MyString"
    resumen "MyString"
    descripcion "MyText"
    clasificacion 1
    localidad nil
    telefono "MyString"
  end
end
