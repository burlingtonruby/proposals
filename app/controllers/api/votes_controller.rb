module Api
  class VotesController < ApplicationController
    respond_to :json

    def create
      votes_in_current_round = current_user.votes.where(round: current_round)

      if votes_in_current_round.count <= current_round.total_votes
        proposal = Proposal.find(params[:vote].fetch(:proposal_id))
        vote = votes_in_current_round.create(proposal: proposal)
        render json: {vote: vote}
      else
        render json: "Too many votes were cast", status: :forbidden
      end
    end

    def destroy
      vote = current_user.votes.find_by(round: current_round)
      vote.destroy
      render json: {}
    end
  end
end
