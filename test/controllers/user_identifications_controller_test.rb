require 'test_helper'

class UserIdentificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_identifications_new_url
    assert_response :success
  end

  test "should get index" do
    get user_identifications_index_url
    assert_response :success
  end

  test "should get show" do
    get user_identifications_show_url
    assert_response :success
  end

  test "should get update" do
    get user_identifications_update_url
    assert_response :success
  end

  test "should get delete" do
    get user_identifications_delete_url
    assert_response :success
  end

end
