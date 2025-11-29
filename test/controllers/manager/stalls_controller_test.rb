require "test_helper"

class Manager::StallsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    # Use the 'manager' user from fixtures, who has an associated stall.
    @manager = users(:manager)
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
    # Get the stall associated with the manager
    stall = @manager.stall
    patch manager_stall_url, params: { stall: { name: "新しい屋台名" } }
    assert_redirected_to manager_stall_url

    # Verify the update was successful
    stall.reload
    assert_equal "新しい屋台名", stall.name
  end
end
