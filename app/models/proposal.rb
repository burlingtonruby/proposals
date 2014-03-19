class Proposal < ActiveRecord::Base
  validates :title, presence: true
  validates :user_id, presence: true
  validates :abstract, presence: true

  belongs_to :user
  accepts_nested_attributes_for :user, update_only: true

  delegate :email, :name, :bio, to: :user, prefix: true

  def save_and_send_confirmation
    save && ProposalMailer.confirmation(id).deliver
  end
end
