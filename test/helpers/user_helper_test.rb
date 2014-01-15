require 'test_helper'

class UserHelperTest < ActionView::TestCase
  include UserHelper

  setup do
    @brett = users(:brett)
  end

  test "current_user should return the signed in user" do
    session[:user_id] = @brett.id
    assert_equal current_user, @brett
  end

  test "if there is no signed in user, return nil" do
    assert_nil current_user
  end
end
