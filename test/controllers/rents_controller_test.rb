require "test_helper"

class RentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rents_index_url
    assert_response :success
  end

  test "should get confirmation" do
    get rents_confirmation_url
    assert_response :success
  end

  test "should get show" do
    get rents_show_url
    assert_response :success
  end
end
