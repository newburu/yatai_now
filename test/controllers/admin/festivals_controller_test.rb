require "test_helper"

class Admin::FestivalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_festival = admin_festivals(:one)
  end

  test "should get index" do
    get admin_festivals_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_festival_url
    assert_response :success
  end

  test "should create admin_festival" do
    assert_difference("Admin::Festival.count") do
      post admin_festivals_url, params: { admin_festival: { is_active: @admin_festival.is_active, name: @admin_festival.name } }
    end

    assert_redirected_to admin_festival_url(Admin::Festival.last)
  end

  test "should show admin_festival" do
    get admin_festival_url(@admin_festival)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_festival_url(@admin_festival)
    assert_response :success
  end

  test "should update admin_festival" do
    patch admin_festival_url(@admin_festival), params: { admin_festival: { is_active: @admin_festival.is_active, name: @admin_festival.name } }
    assert_redirected_to admin_festival_url(@admin_festival)
  end

  test "should destroy admin_festival" do
    assert_difference("Admin::Festival.count", -1) do
      delete admin_festival_url(@admin_festival)
    end

    assert_redirected_to admin_festivals_url
  end
end
