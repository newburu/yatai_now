require "test_helper"

class Admin::StallsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stall = stalls(:one)
    sign_in users(:admin)
  end

  test "should get index" do
    get admin_stalls_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_stall_url
    assert_response :success
  end

  test "should create stall" do
    assert_difference("Stall.count") do
      post admin_stalls_url, params: { stall: {
        auth_code: @stall.auth_code,
        description: @stall.description,
        festival_id: @stall.festival_id,
        name: "New Stall",
        status_text: @stall.status_text,
        user_id: @stall.user_id
      } }
    end

    assert_redirected_to admin_stall_url(Stall.last)
  end

  test "should show stall" do
    get admin_stall_url(@stall)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_stall_url(@stall)
    assert_response :success
  end

  test "should update stall" do
    patch admin_stall_url(@stall), params: { stall: {
      auth_code: @stall.auth_code,
      description: @stall.description,
      festival_id: @stall.festival_id,
      name: @stall.name,
      status_text: @stall.status_text,
      user_id: @stall.user_id
    } }
    assert_redirected_to admin_stall_url(@stall)
  end

  test "should destroy stall" do
    assert_difference("Stall.count", -1) do
      delete admin_stall_url(@stall)
    end

    assert_redirected_to admin_stalls_url
  end
end
