require 'test_helper'

class EventosControllerTest < ActionController::TestCase
  setup do
    @evento = eventos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eventos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create evento" do
    assert_difference('Evento.count') do
      post :create, evento: { costo: @evento.costo, descripcion: @evento.descripcion, fecha_y_hora: @evento.fecha_y_hora, nombre: @evento.nombre, resumen: @evento.resumen }
    end

    assert_redirected_to evento_path(assigns(:evento))
  end

  test "should show evento" do
    get :show, id: @evento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @evento
    assert_response :success
  end

  test "should update evento" do
    put :update, id: @evento, evento: { costo: @evento.costo, descripcion: @evento.descripcion, fecha_y_hora: @evento.fecha_y_hora, nombre: @evento.nombre, resumen: @evento.resumen }
    assert_redirected_to evento_path(assigns(:evento))
  end

  test "should destroy evento" do
    assert_difference('Evento.count', -1) do
      delete :destroy, id: @evento
    end

    assert_redirected_to eventos_path
  end
end
