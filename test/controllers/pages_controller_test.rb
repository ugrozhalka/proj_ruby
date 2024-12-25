require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show_confirm_delete" do
    get pages_show_confirm_delete_url
    assert_response :success
  end
end
