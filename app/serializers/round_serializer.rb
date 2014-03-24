class RoundSerializer < ActiveModel::Serializer
  root false

  attributes :id, :text, :total_votes, :is_anonymous, :is_current_round, :name,
    :is_completed

  def name
    object.to_s
  end

  def id
    object.to_i
  end

  def is_anonymous
    object.anonymous?
  end

  def is_completed
    object.completed?
  end

  def is_current_round
    object == Rails.configuration.current_round
  end
end
