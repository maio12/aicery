require 'test_helper'

class ListsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get lists_show_url
    assert_response :success
  end
  test "should get edit" do
    get lists_edit_url
    assert_response :success
  end

  test "should get update" do
    get lists_update_url
    assert_response :success
  end
  # test "the truth" do
  #   assert true
  # end
end
