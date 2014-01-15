class Proposal < ActiveRecord::Base
  validates :title, presence: true
end
