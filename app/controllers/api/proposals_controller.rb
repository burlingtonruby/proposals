module Api
  class ProposalsController < ApplicationController
    respond_to :json
    before_filter :require_voter!

    def index
      current_votes = current_user.votes.where(round: current_round).
        includes(:proposal)

      current_hidden_votes = current_user.hidden_votes.where(round: current_round).
        includes(:proposal)

      respond_with current_round.proposals,
        each_serializer: ProposalSerializer,
        current_votes: current_votes,
        current_hidden_votes: current_hidden_votes
    end

    def show
      proposal = Proposal.find(params[:id])
      respond_with proposal, serializer: ProposalSerializer
    end
  end
end
