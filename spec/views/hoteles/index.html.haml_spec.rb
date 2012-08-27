require 'spec_helper'

describe "hoteles/index" do
  before(:each) do
    assign(:hoteles, [
      stub_model(Hotel,
        :nombre => "Nombre",
        :resumen => "Resumen",
        :descripcion => "MyText",
        :clasificacion => 1,
        :total_habitaciones => 2,
        :localidad => nil,
        :costo => "9.99",
        :telefono => "Telefono"
      ),
      stub_model(Hotel,
        :nombre => "Nombre",
        :resumen => "Resumen",
        :descripcion => "MyText",
        :clasificacion => 1,
        :total_habitaciones => 2,
        :localidad => nil,
        :costo => "9.99",
        :telefono => "Telefono"
      )
    ])
  end

  it "renders a list of hoteles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => "Resumen".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Telefono".to_s, :count => 2
  end
end
