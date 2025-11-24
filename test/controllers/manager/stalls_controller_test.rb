require "test_helper"

class Manager::StallsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @manager = users(:one)
    @stall = stalls(:one)
    sign_in @manager
  end

  test "should get show" do
    get manager_stall_url
    assert_response :success
  end

  test "should get edit" do
    get edit_manager_stall_url
    assert_response :success
  end

  test "should update stall" do
    patch manager_stall_url, params: { stall: { name: "New Name" } }
    assert_redirected_to manager_stall_url
    @stall.reload
    assert_equal "New Name", @stall.name
  end

  test "should attach icon to stall" do
    icon = fixture_file_upload("icon.png", "image/png")
    patch manager_stall_url, params: { stall: { icon: icon } }
    assert @stall.reload.icon.attached?
  end
end
