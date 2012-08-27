require 'spec_helper'

describe "hoteles/new" do
  before(:each) do
    assign(:hotel, stub_model(Hotel,
      :nombre => "MyString",
      :resumen => "MyString",
      :descripcion => "MyText",
      :clasificacion => 1,
      :total_habitaciones => 1,
      :localidad => nil,
      :costo => "9.99",
      :telefono => "MyString"
    ).as_new_record)
  end

  it "renders new hotel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hoteles_path, :method => "post" do
      assert_select "input#hotel_nombre", :name => "hotel[nombre]"
      assert_select "input#hotel_resumen", :name => "hotel[resumen]"
      assert_select "textarea#hotel_descripcion", :name => "hotel[descripcion]"
      assert_select "input#hotel_clasificacion", :name => "hotel[clasificacion]"
      assert_select "input#hotel_total_habitaciones", :name => "hotel[total_habitaciones]"
      assert_select "input#hotel_localidad", :name => "hotel[localidad]"
      assert_select "input#hotel_costo", :name => "hotel[costo]"
      assert_select "input#hotel_telefono", :name => "hotel[telefono]"
    end
  end
end
