require "test_helper"

class Manager::StallsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get manager_stalls_show_url
    assert_response :success
  end

  test "should get edit" do
    get manager_stalls_edit_url
    assert_response :success
  end

  test "should get update" do
    get manager_stalls_update_url
    assert_response :success
  end
end
