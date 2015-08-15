require 'test_helper'

class Admin::HomesteadsControllerTest < ActionController::TestCase
  setup do
    @admin_homestead = admin_homesteads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_homesteads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_homestead" do
    assert_difference('Admin::Homestead.count') do
      post :create, admin_homestead: { acreage_s: @admin_homestead.acreage_s, altitude: @admin_homestead.altitude, cadastral_num: @admin_homestead.cadastral_num, corner_site: @admin_homestead.corner_site, discount: @admin_homestead.discount, domain_id: @admin_homestead.domain_id, has_coast: @admin_homestead.has_coast, has_forest: @admin_homestead.has_forest, k_browsing: @admin_homestead.k_browsing, k_interes: @admin_homestead.k_interes, land_link_id: @admin_homestead.land_link_id, land_use_id: @admin_homestead.land_use_id, neighbors: @admin_homestead.neighbors, note: @admin_homestead.note, outside_site: @admin_homestead.outside_site, phase: @admin_homestead.phase, price: @admin_homestead.price, shape_id: @admin_homestead.shape_id, site_num: @admin_homestead.site_num, slope: @admin_homestead.slope, status_id: @admin_homestead.status_id }
    end

    assert_redirected_to admin_homestead_path(assigns(:admin_homestead))
  end

  test "should show admin_homestead" do
    get :show, id: @admin_homestead
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_homestead
    assert_response :success
  end

  test "should update admin_homestead" do
    patch :update, id: @admin_homestead, admin_homestead: { acreage_s: @admin_homestead.acreage_s, altitude: @admin_homestead.altitude, cadastral_num: @admin_homestead.cadastral_num, corner_site: @admin_homestead.corner_site, discount: @admin_homestead.discount, domain_id: @admin_homestead.domain_id, has_coast: @admin_homestead.has_coast, has_forest: @admin_homestead.has_forest, k_browsing: @admin_homestead.k_browsing, k_interes: @admin_homestead.k_interes, land_link_id: @admin_homestead.land_link_id, land_use_id: @admin_homestead.land_use_id, neighbors: @admin_homestead.neighbors, note: @admin_homestead.note, outside_site: @admin_homestead.outside_site, phase: @admin_homestead.phase, price: @admin_homestead.price, shape_id: @admin_homestead.shape_id, site_num: @admin_homestead.site_num, slope: @admin_homestead.slope, status_id: @admin_homestead.status_id }
    assert_redirected_to admin_homestead_path(assigns(:admin_homestead))
  end

  test "should destroy admin_homestead" do
    assert_difference('Admin::Homestead.count', -1) do
      delete :destroy, id: @admin_homestead
    end

    assert_redirected_to admin_homesteads_path
  end
end
