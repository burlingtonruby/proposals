class VotingController < ApplicationController
  before_filter :require_voter!

  def index
    @round1 = current_user.votes.where(round: 1).includes(:proposal).map(&:proposal).sort_by(&:title)
    @round2 = current_user.votes.where(round: 2).includes(:proposal).map(&:proposal).sort_by(&:title)
  end
end
