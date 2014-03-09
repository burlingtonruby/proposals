class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :proposal

  classy_enum_attr :round
end
