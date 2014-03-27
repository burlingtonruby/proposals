class Round < ClassyEnum::Base
  include ActiveModel::Serialization

  def completed?
    self < Rails.configuration.current_round
  end
end

class Round::One < Round
  def text
    'Round 1'
  end

  # Number of votes a voter gets to cast in this round
  def total_votes
    25
  end

  # Will names and other identifying info be hidden from voters?
  def anonymous?
    true
  end

  # Proposals displayed during voting
  def proposals
    Proposal.order(:title)
  end
end

class Round::Two < Round
  def text
    'Round 2'
  end

  # Number of votes a voter gets to cast in this round
  def total_votes
    8
  end

  # Will names and other identifying info be hidden from voters?
  def anonymous?
    false
  end

  # Proposals displayed during voting
  def proposals
    Proposal.where(round2: true).order(:title)
  end
end

class Round::Three < Round
  def text
    'Round 3'
  end

  def total_votes
    0
  end

  def anonymous?
    false
  end

  def proposals
    Proposal.none
  end
end
