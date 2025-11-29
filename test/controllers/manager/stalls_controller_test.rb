require "test_helper"

class Manager::StallsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @manager = users(:one)
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
    patch manager_stall_url, params: { stall: { name: "新しい屋台名" } }
    assert_redirected_to manager_stall_url
  end
end
