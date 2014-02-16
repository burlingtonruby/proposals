class VotesController < ApplicationController
  before_filter :require_voter!
  before_action :set_round

  def index
    @current_votes = current_user.votes.where(round: current_round).
      includes(:proposal).map(&:proposal)

    @proposals = current_round.proposals
  end

  def bulk_create
    if proposal_ids.size <= current_round.total_votes
      proposals = Proposal.find(proposal_ids)
      current_user.votes.where(round: current_round).destroy_all

      proposals.each do |proposal|
        current_user.votes.create(round: current_round, proposal: proposal)
      end

      redirect_to voting_url, notice: "Your votes have been recorded"
    else
      @current_votes = Proposal.find(proposal_ids)
      @proposals = current_round.proposals
      flash.now[:alert] = "Too many votes were cast"
      render :index
    end
  end

  private

  def set_round
    @round = Round.find(params[:round])

    # Don't let voting beyond the current round happen
    if @round > current_round
      redirect_to voting_url, alert: "Voting for #{@round.text} is not open!"
    end
  end

  def proposal_ids
    params[:votes]
  end
end
