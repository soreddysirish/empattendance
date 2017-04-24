require 'test_helper'

class ChangeUserSettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get change_user_settings_edit_url
    assert_response :success
  end

end
