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

    voting_for = ["Rails Doesn't Scale", "PHP Forever"]

    voting_for.each do |title|
      proposal = Proposal.find_by(title: title)

      within '.proposal', text: title do
        find('.abstract', text: proposal.abstract)

        find('.tabs dd', text: 'Notes').click
        find('.notes', text: proposal.notes)

        find('.tabs dd', text: 'Pitch').click
        find('.pitch', text: 'not available')

        find('.tabs dd', text: 'Submitter').click
        find('.user-info', text: 'not available')

        # Vote and wait until AJAX request completes
        find('span.vote').click
        find('span.vote.selected')
      end
    end

    assert_equal 2, @user.votes.where(round: :one).count

    click_link 'Voting'

    voting_for.each do |title|
      find('li', text: title)
    end
  end
end
