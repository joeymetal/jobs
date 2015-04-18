require 'test_helper'

class AdsControllerTest < ActionController::TestCase
  test "should get ads1" do
    get :ads1
    assert_response :success
  end

  test "should get ads2" do
    get :ads2
    assert_response :success
  end

  test "should get ads3" do
    get :ads3
    assert_response :success
  end

  test "should get ads4" do
    get :ads4
    assert_response :success
  end

end
