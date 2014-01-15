require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @brett = users(:brett)
    @pete = users(:pete)
  end

  test 'should show user' do
    sign_in @brett
    get :show, id: @brett
    assert_response :success
    assert_not_nil assigns(:user)
  end

  test 'edit should render correct layout' do
    sign_in @brett
    get :edit, id: @brett
    assert_response :success
    assert_not_nil assigns(:user)
  end

  test 'should update user' do
    sign_in @brett
    patch :update, id: @brett.id, user: { bio: 'Probably not a cat.' }
    assert_redirected_to user_path(assigns(:user))
    assert_equal 'Profile successfully updated.', flash[:success]
  end

  test 'user should only be able to view profile they have access to' do
    sign_in @pete
    get :show, id: @brett
    assert_response 401
  end

  test 'user should only be able to edit their own profile' do
    sign_in @pete
    get :edit, id: @brett
    assert_response 401
  end

  test 'user should only be able to update their own profile' do
    sign_in @pete
    patch :update, id: @brett.id, user: { bio: 'Probably not a cat.' }
    assert_response 401
  end
end
