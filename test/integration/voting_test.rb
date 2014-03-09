require 'test_helper'

class VotingTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.current_driver = Capybara.javascript_driver

    @user = users(:voter)
    login_user @user
  end

  test 'Voter votes for proposals in round 1' do
    visit root_path
    click_link 'Sign In w/ GitHub'
    click_link 'Voting'
    click_link 'Cast your vote'

    ["Rails Doesn't Scale", "PHP Forever"].each do |title|
      proposal = find('.proposal', text: title)
      proposal.find('span.vote').click
      proposal.find('span.vote.selected')
    end

    assert_equal 2, @user.votes.where(round: :one).count
  end
end
