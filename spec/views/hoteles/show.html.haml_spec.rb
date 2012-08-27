require 'spec_helper'

describe "hoteles/show" do
  before(:each) do
    @hotel = assign(:hotel, stub_model(Hotel,
      :nombre => "Nombre",
      :resumen => "Resumen",
      :descripcion => "MyText",
      :clasificacion => 1,
      :total_habitaciones => 2,
      :localidad => nil,
      :costo => "9.99",
      :telefono => "Telefono"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nombre/)
    rendered.should match(/Resumen/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(//)
    rendered.should match(/9.99/)
    rendered.should match(/Telefono/)
  end
end
