class ProposalSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :title, :abstract, :notes, :pitch, :user_name, :twitter,
    :github, :selected, :visible

  has_one :vote

  def vote
    vote = current_user.votes.find_by(round: options[:current_round], proposal: object)
    return if vote.nil?
    VoteSerializer.new(vote)
  end

  def visible
    true
  end

  def selected
    vote.present?
  end

  def pitch
    object.pitch unless anonymous_round?
  end

  def user_name
    object.user_name unless anonymous_round?
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
