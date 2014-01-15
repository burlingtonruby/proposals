require 'test_helper'

class ProposalsControllerTest < ActionController::TestCase
  setup do
    @rails_doesnt_scale = proposals(:rails_doesnt_scale)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:proposals)
  end

  test 'should create proposal' do
    assert_difference('Proposal.count') do
      post :create, proposal: { title: 'Great Talk' }
    end

    assert_redirected_to proposal_path(assigns(:proposal))
    assert_equal 'Proposal successfully created. You will hear from us when the CFP closes. Thanks!', flash[:success]
  end

  test 'new should render correct layout' do
    get :new
    assert_template layout: 'layouts/application', partial: '_form'
    assert_not_nil assigns(:proposal)
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
