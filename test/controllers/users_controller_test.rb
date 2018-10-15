require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get view_all_users" do
    get users_view_all_users_url
    assert_response :success
  end

end
