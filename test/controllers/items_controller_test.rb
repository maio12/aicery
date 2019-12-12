require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get items_update_url
    assert_response :success
  end

end
