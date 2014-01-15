require 'test_helper'

class ProposalsControllerTest < ActionController::TestCase
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
end
