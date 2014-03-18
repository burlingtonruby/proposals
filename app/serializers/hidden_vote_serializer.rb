class HiddenVoteSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :proposal_id
  has_one :proposal
end
