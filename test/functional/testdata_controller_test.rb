require 'test_helper'

class TestdataControllerTest < ActionController::TestCase
  test "should get nombre_servicio" do
    get :nombre_servicio
    assert_response :success
  end

end
