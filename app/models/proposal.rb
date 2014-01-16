class Proposal < ActiveRecord::Base
  validates :title, presence: true
  validates :user_id, presence: true
  validates :abstract, presence: true

  belongs_to :user
  accepts_nested_attributes_for :user, update_only: true

end
