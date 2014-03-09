class VotingSerializer < ActiveModel::Serializer
  attributes :id

  embed :ids, include: true
  attributes :id, :round
  has_one :proposal, serializer: ProposalListSerializer

  def round
    object.round.to_s
  end
end
