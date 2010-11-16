require 'test_helper'

class OrdenesControllerTest < ActionController::TestCase
  setup do
    @orden = ordenes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ordenes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orden" do
    assert_difference('Orden.count') do
      post :create, :orden => @orden.attributes
    end

    assert_redirected_to orden_path(assigns(:orden))
  end

  test "should show orden" do
    get :show, :id => @orden.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @orden.to_param
    assert_response :success
  end

  test "should update orden" do
    put :update, :id => @orden.to_param, :orden => @orden.attributes
    assert_redirected_to orden_path(assigns(:orden))
  end

  test "should destroy orden" do
    assert_difference('Orden.count', -1) do
      delete :destroy, :id => @orden.to_param
    end

    assert_redirected_to ordenes_path
  end
end
