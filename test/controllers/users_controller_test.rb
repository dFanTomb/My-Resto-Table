require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get user_name:strin" do
    get users_user_name:strin_url
    assert_response :success
  end

  test "should get password:string" do
    get users_password:string_url
    assert_response :success
  end

  test "should get email:string" do
    get users_email:string_url
    assert_response :success
  end
end
