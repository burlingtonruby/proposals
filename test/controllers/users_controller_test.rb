require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @brett = users(:brett)
  end

  test 'should show user' do
    get :show, id: @brett
    assert_response :success
    assert_not_nil assigns(:user)
  end
end
