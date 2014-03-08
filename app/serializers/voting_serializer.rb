class VotingSerializer < ActiveModel::Serializer
  attributes :id

  embed :ids, include: true
  attributes :id, :round
  has_one :proposal

  def round
    object.round.to_s
  end
end
