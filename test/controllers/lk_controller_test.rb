require 'test_helper'

class LkControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get order" do
    get :order
    assert_response :success
  end

  test "should get consultation" do
    get :consultation
    assert_response :success
  end

end
