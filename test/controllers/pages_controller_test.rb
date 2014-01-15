require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  setup do
    @brett = users(:brett)
  end

  test "should get welcome" do
    get :welcome
    assert_response :success
  end

  test "welcome should redirect to proposals if signed in" do
    sign_in @brett
    get :welcome
    assert_redirected_to proposals_path
  end
end
