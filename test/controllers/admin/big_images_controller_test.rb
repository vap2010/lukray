require 'test_helper'

class Admin::BigImagesControllerTest < ActionController::TestCase
  setup do
    @admin_big_image = admin_big_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_big_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_big_image" do
    assert_difference('Admin::BigImage.count') do
      post :create, admin_big_image: { category_id: @admin_big_image.category_id, is_deleted: @admin_big_image.is_deleted, is_public: @admin_big_image.is_public, params: @admin_big_image.params, position: @admin_big_image.position, title: @admin_big_image.title }
    end

    assert_redirected_to admin_big_image_path(assigns(:admin_big_image))
  end

  test "should show admin_big_image" do
    get :show, id: @admin_big_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_big_image
    assert_response :success
  end

  test "should update admin_big_image" do
    patch :update, id: @admin_big_image, admin_big_image: { category_id: @admin_big_image.category_id, is_deleted: @admin_big_image.is_deleted, is_public: @admin_big_image.is_public, params: @admin_big_image.params, position: @admin_big_image.position, title: @admin_big_image.title }
    assert_redirected_to admin_big_image_path(assigns(:admin_big_image))
  end

  test "should destroy admin_big_image" do
    assert_difference('Admin::BigImage.count', -1) do
      delete :destroy, id: @admin_big_image
    end

    assert_redirected_to admin_big_images_path
  end
end
