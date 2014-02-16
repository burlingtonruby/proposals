class VotingController < ApplicationController
  before_filter :require_voter!

  def index
    @round1 = current_user.votes.for_round(:one)
    @round2 = current_user.votes.for_round(:two)
  end
end
