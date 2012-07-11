require 'test_helper'

class LocalidadesControllerTest < ActionController::TestCase
  setup do
    @localidad = localidades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:localidades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create localidad" do
    assert_difference('Localidad.count') do
      post :create, localidad: { nombre: @localidad.nombre }
    end

    assert_redirected_to localidad_path(assigns(:localidad))
  end

  test "should show localidad" do
    get :show, id: @localidad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @localidad
    assert_response :success
  end

  test "should update localidad" do
    put :update, id: @localidad, localidad: { nombre: @localidad.nombre }
    assert_redirected_to localidad_path(assigns(:localidad))
  end

  test "should destroy localidad" do
    assert_difference('Localidad.count', -1) do
      delete :destroy, id: @localidad
    end

    assert_redirected_to localidades_path
  end
end
