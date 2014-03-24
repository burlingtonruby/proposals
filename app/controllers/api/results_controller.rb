module Api
  class ResultsController < ApplicationController
    respond_to :json
    before_filter :require_voter!, :verify_round_complete

    def index
      respond_with Vote.results_for_round(round)
    end

    private

    def round
      Round.detect { |round| round.to_i == params[:round].to_i }
    end

    def verify_round_complete
      unless round.completed?
        render json: {}, status: :unauthorized
      end
    end
  end
end
