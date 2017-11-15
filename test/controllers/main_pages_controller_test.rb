# Test case that allows the MainPages controller to be tested.

require 'test_helper'

class MainPagesControllerTest < ActionDispatch::IntegrationTest

  #Tests if the correct path and title is returned.
  test "should get root" do
    get root_path
    assert_response :success
    assert_select "title", "Home | uTunes"
  end

  #Tests if the correct path and title is returned.
  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | uTunes"
  end

  #Tests if the correct path and title is returned.
  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | uTunes"
  end

  #Tests if the correct path and title is returned.
  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | uTunes"
  end

end