class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :proposal

  classy_enum_attr :round

  def self.for_round(round)
    where(round: round).includes(:proposal).map(&:proposal).sort_by(&:title)
  end
end
