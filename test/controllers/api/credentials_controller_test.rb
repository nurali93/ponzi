require 'test_helper'

class Api::CredentialsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_credentials_index_url
    assert_response :success
  end

end
