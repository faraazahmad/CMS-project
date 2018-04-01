require 'test_helper'

class CitizensControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get citizens_new_url
    assert_response :success
  end

end
