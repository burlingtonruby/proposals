class Round < ClassyEnum::Base
end

class Round::One < Round
  def text
    'Round 1'
  end

  # Number of votes a voter gets to cast in this round
  def total_votes
    15
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
    5
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
