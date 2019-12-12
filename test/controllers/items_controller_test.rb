require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest

  test "should get create" do
    get items_create_url
  test "should get update" do
    get items_update_url
    assert_response :success
  end
end

end
