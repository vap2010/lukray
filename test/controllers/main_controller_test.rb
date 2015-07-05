require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get page" do
    get :page
    assert_response :success
  end

  test "should get township" do
    get :township
    assert_response :success
  end

  test "should get plan" do
    get :plan
    assert_response :success
  end

  test "should get location" do
    get :location
    assert_response :success
  end

  test "should get infrastructure" do
    get :infrastructure
    assert_response :success
  end

  test "should get nature" do
    get :nature
    assert_response :success
  end

  test "should get gallery" do
    get :gallery
    assert_response :success
  end

  test "should get environs" do
    get :environs
    assert_response :success
  end

  test "should get customers" do
    get :customers
    assert_response :success
  end

  test "should get contacts" do
    get :contacts
    assert_response :success
  end

end
