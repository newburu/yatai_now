require "test_helper"

class SenderControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sender_index_url
    assert_response :success
  end
end
