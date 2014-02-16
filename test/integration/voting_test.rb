require 'test_helper'

class VotingTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:voter)
    login_user @user

    20.times do |int|
      user = User.create!(
        provider: 'github',
        uid: int,
        name: "User #{int}",
        email: "user#{int}@email.com",
        bio: "blah",
        website: "blah.com",
        twitter: "twitter#{int}",
        github: "github#{int}",
        photo_file_name: "face.jpg",
        photo_content_type: "image/jpeg",
        photo_file_size: 836486
      )

      proposal = user.proposals.create!(
        title: "My Proposal #{int}",
        abstract: "OMG CATFOOD!"
      )
    end
  end

  test 'Voter votes for proposals in round 1' do
    visit root_path
    click_link 'Sign In w/ GitHub'
    click_link 'Voting'
    click_link 'Cast your vote'

    # select first 15 proposals
    Proposal.offset(3).limit(15).each do |proposal|
      check "proposal_#{proposal.id}"
    end

    click_button 'Submit Votes'

    assert_equal 15, @user.votes.where(round: :one).count
  end
end
