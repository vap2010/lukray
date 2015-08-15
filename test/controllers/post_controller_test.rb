require 'test_helper'

class PostControllerTest < ActionController::TestCase
  test "should get viewing_areas" do
    get :viewing_areas
    assert_response :success
  end

  test "should get consultation" do
    get :consultation
    assert_response :success
  end

  test "should get back_call" do
    get :back_call
    assert_response :success
  end

  test "should get booking_area" do
    get :booking_area
    assert_response :success
  end

  test "should get question_from_site" do
    get :question_from_site
    assert_response :success
  end

  test "should get recommendation" do
    get :recommendation
    assert_response :success
  end

  test "should get fsm_status" do
    get :fsm_status
    assert_response :success
  end

  test "should get business" do
    get :business
    assert_response :success
  end

  test "should get other" do
    get :other
    assert_response :success
  end

end
