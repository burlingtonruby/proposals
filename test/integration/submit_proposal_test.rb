require 'test_helper'

class SubmitProposalTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:pete)
    login_user @user
  end

  test 'Existing user creates a proposal' do
    visit root_path
    click_link 'Sign In w/ GitHub'

    within '.proposals' do
      click_link 'Submit Proposal'
    end

    fill_in 'Name', with: 'Sebastian'
    fill_in 'Email', with: 'sebastian@email.com'
    fill_in 'Bio', with: 'My Bio'
    fill_in 'Your Website', with: 'www.cats.com'
    fill_in 'Your GitHub Username', with: 'catluvr4a'
    fill_in 'Your Twitter Handle', with: 'catluvr4'
    fill_in 'Title', with: 'How to Ruby'
    fill_in 'Abstract', with: 'OMG SO RUBY!!!'
    fill_in 'Notes', with: 'You will luv this talk'
    fill_in 'Pitch', with: 'I work for the best ruby shop in the world' 
    click_button 'Submit Proposal'

    assert_match 'Proposal successfully created.', page.body

    @user.reload
    assert_equal 'Sebastian', @user.name
    assert_equal 'sebastian@email.com', @user.email
    assert_equal 'My Bio', @user.bio
    assert_equal 'www.cats.com', @user.website
    assert_equal 'catluvr4', @user.twitter
    assert_equal 'catluvr4a', @user.github

    proposal = @user.proposals.last
    assert_equal @user.name, proposal.user.name
    assert_equal proposal_path(proposal), page.current_path
    assert_equal 'How to Ruby', proposal.title
    assert_equal 'OMG SO RUBY!!!', proposal.abstract
    assert_equal 'You will luv this talk', proposal.notes
    assert_equal 'I work for the best ruby shop in the world', proposal.pitch
  end
end
