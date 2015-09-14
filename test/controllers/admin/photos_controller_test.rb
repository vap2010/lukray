require 'test_helper'

class Admin::PhotosControllerTest < ActionController::TestCase
  setup do
    @admin_photo = admin_photos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_photo" do
    assert_difference('Admin::Photo.count') do
      post :create, admin_photo: { announce: @admin_photo.announce, body: @admin_photo.body, category_id: @admin_photo.category_id, is_deleted: @admin_photo.is_deleted, is_preview_published: @admin_photo.is_preview_published, is_published: @admin_photo.is_published, is_shown_in_menu: @admin_photo.is_shown_in_menu, menu_title: @admin_photo.menu_title, position: @admin_photo.position, skin_id: @admin_photo.skin_id, title: @admin_photo.title }
    end

    assert_redirected_to admin_photo_path(assigns(:admin_photo))
  end

  test "should show admin_photo" do
    get :show, id: @admin_photo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_photo
    assert_response :success
  end

  test "should update admin_photo" do
    patch :update, id: @admin_photo, admin_photo: { announce: @admin_photo.announce, body: @admin_photo.body, category_id: @admin_photo.category_id, is_deleted: @admin_photo.is_deleted, is_preview_published: @admin_photo.is_preview_published, is_published: @admin_photo.is_published, is_shown_in_menu: @admin_photo.is_shown_in_menu, menu_title: @admin_photo.menu_title, position: @admin_photo.position, skin_id: @admin_photo.skin_id, title: @admin_photo.title }
    assert_redirected_to admin_photo_path(assigns(:admin_photo))
  end

  test "should destroy admin_photo" do
    assert_difference('Admin::Photo.count', -1) do
      delete :destroy, id: @admin_photo
    end

    assert_redirected_to admin_photos_path
  end
end
