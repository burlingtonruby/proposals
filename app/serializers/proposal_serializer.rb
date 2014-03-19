class ProposalSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :title, :abstract, :notes, :pitch, :user_name, :twitter,
    :github, :selected, :visible, :user_bio

  has_one :vote
  has_one :hidden_vote

  def vote
    vote = options[:current_votes].detect { |vote| vote.proposal_id == object.id }
    return if vote.nil?
    VoteSerializer.new(vote)
  end

  def hidden_vote
    vote = options[:current_hidden_votes].detect { |vote| vote.proposal_id == object.id }
    return if vote.nil?
    HiddenVoteSerializer.new(vote)
  end

  def selected
    vote.present?
  end

  def visible
    hidden_vote.nil?
  end

  def pitch
    object.pitch unless anonymous_round?
  end

  def user_name
    object.user_name unless anonymous_round?
  end

  def user_bio
    object.user_bio unless anonymous_round?
  end

  def twitter
    object.user.twitter unless anonymous_round?
  end

  def github
    object.user.github unless anonymous_round?
  end

  private

  def anonymous_round?
    Rails.configuration.current_round.anonymous?
  end
end
