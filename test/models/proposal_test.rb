require 'test_helper'

class ProposalTest < ActiveSupport::TestCase
  test "should not save a proposal without a title" do
    proposal = Proposal.new
    assert !proposal.save, "Saved the proposal without a title"
  end
end
