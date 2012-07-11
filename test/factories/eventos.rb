# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :evento do
    nombre "MyString"
    resumen "MyText"
    descripcion "MyText"
    fecha_y_hora "2012-07-11 12:26:04"
    costo "MyString"
  end
end
