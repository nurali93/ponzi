require 'test_helper'

class OauthApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get oauth_applications_index_url
    assert_response :success
  end

  test "should get new" do
    get oauth_applications_new_url
    assert_response :success
  end

  test "should get edit" do
    get oauth_applications_edit_url
    assert_response :success
  end

  test "should get show" do
    get oauth_applications_show_url
    assert_response :success
  end

end
