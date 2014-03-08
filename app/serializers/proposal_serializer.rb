class ProposalSerializer < ActiveModel::Serializer
  attributes :id, :title, :abstract, :notes, :pitch, :user_name, :twitter,
    :github, :selected

  def selected
    options[:current_votes].include? object
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
