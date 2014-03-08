module Api
  class VotesController < ApplicationController
    respond_to :json

    def index
      respond_with current_user.votes, each_serializer: VotingSerializer
    end

    def create
      votes_in_current_round = current_user.votes.where(round: current_round)

      if votes_in_current_round.count < current_round.total_votes
        proposal = Proposal.find(params[:vote].fetch(:proposal_id))
        vote = votes_in_current_round.create(proposal: proposal)
        render json: {vote: vote}
      else
        render json: "You are limited to #{current_round.total_votes} votes in this round", status: :forbidden
      end
    end

    def destroy
      vote = current_user.votes.where(round: current_round).find(params[:id])
      vote.destroy
      render json: {}
    end
  end
end
