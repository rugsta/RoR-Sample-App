require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
  end

  test "should get help page" do
    get help_path
    assert_response :success
  end

  test "should get about page" do
    get about_path
    assert_response :success
  end

  test "should get contact page" do
    get contact_path
    assert_response :success
  end
end
