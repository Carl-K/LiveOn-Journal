require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get sign_in" do
    get session_sign_in_url
    assert_response :success
  end

end
