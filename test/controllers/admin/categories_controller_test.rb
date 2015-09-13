require 'test_helper'

class Admin::CategoriesControllerTest < ActionController::TestCase
  setup do
    @admin_category = admin_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_category" do
    assert_difference('Admin::Category.count') do
      post :create, admin_category: { image: @admin_category.image, is_deleted: @admin_category.is_deleted, is_published: @admin_category.is_published, position: @admin_category.position, text: @admin_category.text, title: @admin_category.title, type_id: @admin_category.type_id }
    end

    assert_redirected_to admin_category_path(assigns(:admin_category))
  end

  test "should show admin_category" do
    get :show, id: @admin_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_category
    assert_response :success
  end

  test "should update admin_category" do
    patch :update, id: @admin_category, admin_category: { image: @admin_category.image, is_deleted: @admin_category.is_deleted, is_published: @admin_category.is_published, position: @admin_category.position, text: @admin_category.text, title: @admin_category.title, type_id: @admin_category.type_id }
    assert_redirected_to admin_category_path(assigns(:admin_category))
  end

  test "should destroy admin_category" do
    assert_difference('Admin::Category.count', -1) do
      delete :destroy, id: @admin_category
    end

    assert_redirected_to admin_categories_path
  end
end
