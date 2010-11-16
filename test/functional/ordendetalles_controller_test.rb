require 'test_helper'

class OrdendetallesControllerTest < ActionController::TestCase
  setup do
    @ordendetalle = ordendetalles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ordendetalles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ordendetalle" do
    assert_difference('Ordendetalle.count') do
      post :create, :ordendetalle => @ordendetalle.attributes
    end

    assert_redirected_to ordendetalle_path(assigns(:ordendetalle))
  end

  test "should show ordendetalle" do
    get :show, :id => @ordendetalle.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ordendetalle.to_param
    assert_response :success
  end

  test "should update ordendetalle" do
    put :update, :id => @ordendetalle.to_param, :ordendetalle => @ordendetalle.attributes
    assert_redirected_to ordendetalle_path(assigns(:ordendetalle))
  end

  test "should destroy ordendetalle" do
    assert_difference('Ordendetalle.count', -1) do
      delete :destroy, :id => @ordendetalle.to_param
    end

    assert_redirected_to ordendetalles_path
  end
end
