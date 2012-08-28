# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :emergencia do
    nombre "MyString"
    resumen "MyString"
    descripcion "MyText"
    localidad nil
    telefono "MyString"
    tipo "MyString"
  end
end
