module Api
  class ProposalsController < ApplicationController
    respond_to :json

    def index
      current_votes = current_user.votes.where(round: current_round).
        includes(:proposal).map(&:proposal)

      respond_with current_round.proposals.limit(2),
        each_serializer: ProposalSerializer,
        current_votes: current_votes
    end
  end
end
