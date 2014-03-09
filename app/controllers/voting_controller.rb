class VotingController < ApplicationController
  before_filter :require_voter!
end
