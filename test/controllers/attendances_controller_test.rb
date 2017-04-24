require 'test_helper'

class AttendancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get attendances_index_url
    assert_response :success
  end

  test "should get new" do
    get attendances_new_url
    assert_response :success
  end

  test "should get update" do
    get attendances_update_url
    assert_response :success
  end

  test "should get destroy" do
    get attendances_destroy_url
    assert_response :success
  end

end
