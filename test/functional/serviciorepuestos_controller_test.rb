require 'test_helper'

class ServiciorepuestosControllerTest < ActionController::TestCase
  setup do
    @serviciorepuesto = serviciorepuestos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:serviciorepuestos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create serviciorepuesto" do
    assert_difference('Serviciorepuesto.count') do
      post :create, :serviciorepuesto => @serviciorepuesto.attributes
    end

    assert_redirected_to serviciorepuesto_path(assigns(:serviciorepuesto))
  end

  test "should show serviciorepuesto" do
    get :show, :id => @serviciorepuesto.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @serviciorepuesto.to_param
    assert_response :success
  end

  test "should update serviciorepuesto" do
    put :update, :id => @serviciorepuesto.to_param, :serviciorepuesto => @serviciorepuesto.attributes
    assert_redirected_to serviciorepuesto_path(assigns(:serviciorepuesto))
  end

  test "should destroy serviciorepuesto" do
    assert_difference('Serviciorepuesto.count', -1) do
      delete :destroy, :id => @serviciorepuesto.to_param
    end

    assert_redirected_to serviciorepuestos_path
  end
end
