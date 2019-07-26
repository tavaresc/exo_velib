require 'test_helper'

class StationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get root_url
    assert_response :success
  end

  test "should get show with lat and lng parameters" do
    lat = Random.new_seed
    lng = Random.new_seed
    get station_url, params: { latitutde: lat, longitude: lng }
    assert_response :success
  end

end
