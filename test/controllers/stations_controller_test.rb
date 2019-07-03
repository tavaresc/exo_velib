require 'test_helper'

class StationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get stations_new_url
    assert_response :success
  end

  test "should get show" do
    get stations_show_url
    assert_response :success
  end

end
