class VotesController < ApplicationController
  before_filter :require_voter!

  def index
    @current_votes = current_user.votes.where(round: current_round).
      includes(:proposal).map(&:proposal)

    @proposals = Proposal.order(:title)
  end

  def bulk_create
    if proposal_ids.size <= 15
      proposals = Proposal.find(proposal_ids)
      current_user.votes.where(round: current_round).destroy_all
      proposals.each do |proposal|
        current_user.votes.create(round: current_round, proposal: proposal)
      end

      redirect_to votes_url, notice: "Your votes have been recorded"
    else
      @current_votes = Proposal.find(proposal_ids)
      @proposals = Proposal.order(:title)
      flash.now[:alert] = "Too many votes were cast"
      render :index
    end
  end

  private

  def proposal_ids
    params[:votes]
  end
end
