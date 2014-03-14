require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get auth_hash" do
    get :auth_hash
    assert_response :success
  end

end
