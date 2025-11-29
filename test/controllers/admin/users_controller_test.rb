require "test_helper"

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in users(:admin)
  end

  test "should get index" do
    get admin_users_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      # Note: A real test would use a unique email
      post admin_users_url, params: { user: { email: "new_user@example.com", role: @user.role, password: "password", password_confirmation: "password" } }
    end

    assert_redirected_to admin_user_url(User.last)
  end

  test "should show user" do
    get admin_user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch admin_user_url(@user), params: { user: { email: @user.email, role: @user.role } }
    assert_redirected_to admin_user_url(@user)
  end

  test "should destroy user" do
    # To avoid foreign key constraint errors with stalls, use a user that is not a manager.
    user_to_delete = users(:viewer)
    assert_difference("User.count", -1) do
      delete admin_user_url(user_to_delete)
    end

    assert_redirected_to admin_users_url
  end
end
