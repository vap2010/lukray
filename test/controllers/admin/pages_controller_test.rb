require 'test_helper'

class Admin::PagesControllerTest < ActionController::TestCase
  setup do
    @admin_page = admin_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_page" do
    assert_difference('Admin::Page.count') do
      post :create, admin_page: { announce: @admin_page.announce, body: @admin_page.body, is_deleted: @admin_page.is_deleted, is_preview_published: @admin_page.is_preview_published, is_published: @admin_page.is_published, is_shown_in_menu: @admin_page.is_shown_in_menu, menu_title: @admin_page.menu_title, parent_id: @admin_page.parent_id, position: @admin_page.position, title: @admin_page.title }
    end

    assert_redirected_to admin_page_path(assigns(:admin_page))
  end

  test "should show admin_page" do
    get :show, id: @admin_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_page
    assert_response :success
  end

  test "should update admin_page" do
    patch :update, id: @admin_page, admin_page: { announce: @admin_page.announce, body: @admin_page.body, is_deleted: @admin_page.is_deleted, is_preview_published: @admin_page.is_preview_published, is_published: @admin_page.is_published, is_shown_in_menu: @admin_page.is_shown_in_menu, menu_title: @admin_page.menu_title, parent_id: @admin_page.parent_id, position: @admin_page.position, title: @admin_page.title }
    assert_redirected_to admin_page_path(assigns(:admin_page))
  end

  test "should destroy admin_page" do
    assert_difference('Admin::Page.count', -1) do
      delete :destroy, id: @admin_page
    end

    assert_redirected_to admin_pages_path
  end
end
