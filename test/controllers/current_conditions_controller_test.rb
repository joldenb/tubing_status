require 'test_helper'

class CurrentConditionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get current_conditions_index_url
    assert_response :success
  end

end
