class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :proposal

  classy_enum_attr :round

  # Only show proposals with more than this many votes in results
  MIN_VOTE_THRESHOLD = 1

  def self.results_for_round(round)
    votes = where(round: round).includes(proposal: :user).group_by(&:proposal)

    votes.map {|proposal, votes|
      {
        id:         proposal.id,
        title:      proposal.title,
        user_name:  anonymous? ? nil : proposal.user_name,
        vote_count: votes.count
      }
    }.select {|result|
      result[:vote_count] > MIN_VOTE_THRESHOLD
    }.sort {|a,b| b[:vote_count] <=> a[:vote_count] }
  end

  def self.anonymous?
    Rails.configuration.current_round.anonymous?
  end
end
