module Api
  class VotesController < ApplicationController
    respond_to :json

    def create
      proposal = Proposal.find(params[:vote].fetch(:proposal_id))
      vote = current_user.votes.create(round: current_round, proposal: proposal)
      render json: {vote: vote}
    end

    def destroy
      vote = current_user.votes.find_by(round: current_round)
      vote.destroy
      render json: {}
    end
  end
end
