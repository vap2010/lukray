require 'test_helper'

class Admin::MetaTagsControllerTest < ActionController::TestCase
  setup do
    @admin_meta_tag = admin_meta_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_meta_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_meta_tag" do
    assert_difference('Admin::MetaTag.count') do
      post :create, admin_meta_tag: { description: @admin_meta_tag.description, hits_count: @admin_meta_tag.hits_count, is_redirect: @admin_meta_tag.is_redirect, keywords: @admin_meta_tag.keywords, metatagable_id: @admin_meta_tag.metatagable_id, metatagable_type: @admin_meta_tag.metatagable_type, no_cache: @admin_meta_tag.no_cache, nofollow: @admin_meta_tag.nofollow, noindex: @admin_meta_tag.noindex, redirect_uri: @admin_meta_tag.redirect_uri, title: @admin_meta_tag.title, url: @admin_meta_tag.url }
    end

    assert_redirected_to admin_meta_tag_path(assigns(:admin_meta_tag))
  end

  test "should show admin_meta_tag" do
    get :show, id: @admin_meta_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_meta_tag
    assert_response :success
  end

  test "should update admin_meta_tag" do
    patch :update, id: @admin_meta_tag, admin_meta_tag: { description: @admin_meta_tag.description, hits_count: @admin_meta_tag.hits_count, is_redirect: @admin_meta_tag.is_redirect, keywords: @admin_meta_tag.keywords, metatagable_id: @admin_meta_tag.metatagable_id, metatagable_type: @admin_meta_tag.metatagable_type, no_cache: @admin_meta_tag.no_cache, nofollow: @admin_meta_tag.nofollow, noindex: @admin_meta_tag.noindex, redirect_uri: @admin_meta_tag.redirect_uri, title: @admin_meta_tag.title, url: @admin_meta_tag.url }
    assert_redirected_to admin_meta_tag_path(assigns(:admin_meta_tag))
  end

  test "should destroy admin_meta_tag" do
    assert_difference('Admin::MetaTag.count', -1) do
      delete :destroy, id: @admin_meta_tag
    end

    assert_redirected_to admin_meta_tags_path
  end
end
