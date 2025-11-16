require "test_helper"

class Admin::StallsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_stall = admin_stalls(:one)
  end

  test "should get index" do
    get admin_stalls_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_stall_url
    assert_response :success
  end

  test "should create admin_stall" do
    assert_difference("Admin::Stall.count") do
      post admin_stalls_url, params: { admin_stall: { auth_code: @admin_stall.auth_code, description: @admin_stall.description, festival_id: @admin_stall.festival_id, name: @admin_stall.name, status_text: @admin_stall.status_text, user_id: @admin_stall.user_id } }
    end

    assert_redirected_to admin_stall_url(Admin::Stall.last)
  end

  test "should show admin_stall" do
    get admin_stall_url(@admin_stall)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_stall_url(@admin_stall)
    assert_response :success
  end

  test "should update admin_stall" do
    patch admin_stall_url(@admin_stall), params: { admin_stall: { auth_code: @admin_stall.auth_code, description: @admin_stall.description, festival_id: @admin_stall.festival_id, name: @admin_stall.name, status_text: @admin_stall.status_text, user_id: @admin_stall.user_id } }
    assert_redirected_to admin_stall_url(@admin_stall)
  end

  test "should destroy admin_stall" do
    assert_difference("Admin::Stall.count", -1) do
      delete admin_stall_url(@admin_stall)
    end

    assert_redirected_to admin_stalls_url
  end
end
