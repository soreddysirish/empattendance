require 'test_helper'

class LeavesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get leaves_index_url
    assert_response :success
  end

  test "should get new" do
    get leaves_new_url
    assert_response :success
  end

  test "should get create" do
    get leaves_create_url
    assert_response :success
  end

  test "should get update" do
    get leaves_update_url
    assert_response :success
  end

end
