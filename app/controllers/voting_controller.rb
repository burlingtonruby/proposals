class VotingController < ApplicationController
  before_filter :require_voter!

  def index
    @rounds = Round.map { |round|
      {
        round: round,
        current_votes: current_user.votes.for_round(round)
      }
    }
  end
end
