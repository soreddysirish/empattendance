require 'test_helper'

class RegisternewemployeesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get registernewemployees_create_url
    assert_response :success
  end

  test "should get new" do
    get registernewemployees_new_url
    assert_response :success
  end

end
