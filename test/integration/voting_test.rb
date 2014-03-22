require 'test_helper'

class VotingTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.current_driver = Capybara.javascript_driver

    @user = users(:voter)
    login_user @user

    # These tests assume the current round is 1
    @prev_round = Rails.configuration.current_round
    Rails.configuration.current_round = Round::One.new
  end

  teardown do
    Rails.configuration.current_round = @prev_round
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

  test 'Voter hides a proposal in round 1' do
    visit root_path
    click_link 'Sign In w/ GitHub'
    click_link 'Voting'
    click_link 'Cast your vote'

    title = "PHP Forever"

    proposal = Proposal.find_by(title: title)

    within '.proposal', text: title do
      find('span.hide').click
    end

    # wait until AJAX request completes
    find('.filters', text: 'Hidden (1)')

    within '.filters' do
      click_link 'Hidden (1)'
    end

    assert_equal 1, @user.hidden_votes.where(round: :one).count

    # Show proposal
    within '.proposal', text: title do
      find('span.hide').click
    end

    # wait until AJAX request completes
    find('.filters', text: 'Hidden (0)')

    assert_equal 0, @user.hidden_votes.where(round: :one).count
  end
end
