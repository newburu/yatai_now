require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get root (home#index)" do
    get root_url
    assert_response :success
    assert_select "h1", /Yatai Now/
    assert_select "a[href=?]", map_path
  end
end
