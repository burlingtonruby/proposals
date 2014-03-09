module Api
  class RoundsController < ApplicationController
    respond_to :json
    before_filter :require_voter!

    def index
      respond_with Round.map {|round| RoundSerializer.new(round).as_json(root: false) }
    end

    def show
      round = Round.detect { |round| round.to_i == params[:id].to_i }
      respond_with RoundSerializer.new(round, root: 'round')
    end
  end
end
