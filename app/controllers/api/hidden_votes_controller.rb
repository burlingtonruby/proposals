module Api
  class HiddenVotesController < ApplicationController
    respond_to :json
    before_filter :require_voter!

    def create
      hidden_votes_in_current_round = current_user.hidden_votes.where(round: current_round)

      proposal = Proposal.find(params[:hidden_vote].fetch(:proposal_id))
      vote = hidden_votes_in_current_round.create(proposal: proposal)
      render json: {hidden_vote: vote}
    end

    def destroy
      vote = current_user.hidden_votes.where(round: current_round).find(params[:id])
      vote.destroy
      render json: {}
    end
  end
end
