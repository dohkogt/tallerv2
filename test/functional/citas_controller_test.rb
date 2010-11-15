require 'test_helper'

class CitasControllerTest < ActionController::TestCase
  setup do
    @cita = citas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:citas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cita" do
    assert_difference('Cita.count') do
      post :create, :cita => @cita.attributes
    end

    assert_redirected_to cita_path(assigns(:cita))
  end

  test "should show cita" do
    get :show, :id => @cita.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cita.to_param
    assert_response :success
  end

  test "should update cita" do
    put :update, :id => @cita.to_param, :cita => @cita.attributes
    assert_redirected_to cita_path(assigns(:cita))
  end

  test "should destroy cita" do
    assert_difference('Cita.count', -1) do
      delete :destroy, :id => @cita.to_param
    end

    assert_redirected_to citas_path
  end
end
