require 'test_helper'

class LibraryControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get library_show_url
    assert_response :success
  end

end
