require "test_helper"

class Admin::FestivalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @festival = festivals(:one)
    sign_in users(:admin)
  end

  test "should get index" do
    get admin_festivals_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_festival_url
    assert_response :success
  end

  test "should create festival" do
    assert_difference("Festival.count") do
      post admin_festivals_url, params: { festival: { is_active: @festival.is_active, name: "New Festival", start_date: Date.today, end_date: Date.today + 3.days } }
    end

    assert_redirected_to admin_festival_url(Festival.last)
  end

  test "should show festival" do
    get admin_festival_url(@festival)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_festival_url(@festival)
    assert_response :success
  end

  test "should update festival" do
    patch admin_festival_url(@festival), params: { festival: { is_active: @festival.is_active, name: @festival.name } }
    assert_redirected_to admin_festival_url(@festival)
  end

  test "should destroy festival" do
    assert_difference("Festival.count", -1) do
      delete admin_festival_url(@festival)
    end

    assert_redirected_to admin_festivals_url
  end
end
