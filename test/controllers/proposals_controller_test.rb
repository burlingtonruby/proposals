require 'test_helper'

class ProposalsControllerTest < ActionController::TestCase
  setup do
    @rails_doesnt_scale = proposals(:rails_doesnt_scale)
    @brett = users(:brett)
  end

  test 'should get index if signed in' do
    sign_in @brett
    get :index
    assert_response :success
    assert_not_nil assigns(:proposals)
  end

  test 'index should redirect to root if signed out' do
    get :index
    assert_redirected_to root_path
    assert_equal "Sorry, but you can't see that.", flash[:alert]
  end

  test 'index should show current_users proposals' do
    sign_in @brett
    get :index
    assert_response :success
    assert_equal @brett.proposals.count, assigns(:proposals).count
  end

  test 'should create proposal if signed in' do
    sign_in @brett

    assert_difference('Proposal.count') do
      post :create, proposal: { title: 'Great Talk', user_id: @brett.id }
    end

    assert_redirected_to proposal_path(assigns(:proposal))
    assert_equal 'Proposal successfully created. You will hear from us when the CFP closes. Thanks!', flash[:success]
  end

  test 'new should render correct layout' do
    sign_in @brett
    get :new
    assert_template layout: 'layouts/application', partial: '_form'
    assert_not_nil assigns(:proposal)
  end

  test 'new should redirect to root if signed out' do
    get :new
    assert_redirected_to root_path
    assert_equal "You must sign in to create a proposal.", flash[:alert]
  end

  test 'should show proposal' do
    get :show, id: @rails_doesnt_scale
    assert_response :success
    assert_not_nil assigns(:proposal)
  end

  test 'edit should render correct layout' do
    get :edit, id: @rails_doesnt_scale
    assert_template layout: 'layouts/application', partial: '_form'
    assert_not_nil assigns(:proposal)
  end

  test 'should update proposal' do
    patch :update, id: @rails_doesnt_scale.id, proposal: { title: "Rails Does Scale" }
    assert_redirected_to proposal_path(assigns(:proposal))
    assert_equal 'Proposal successfully updated.', flash[:success]
  end

  test 'should destroy proposal' do
    assert_difference('Proposal.count', -1) do
      delete :destroy, id: @rails_doesnt_scale.id
    end

    assert_redirected_to proposals_path
    assert_equal 'Proposal destroyed.', flash[:notice]
  end
end
