require 'test_helper'

class ProposalTest < ActiveSupport::TestCase
  setup do
    @brett = users(:brett)
  end

  test "should not save a proposal without a title" do
    proposal = Proposal.new(user: @brett)
    assert !proposal.save, "Saved the proposal without a title"
  end

  test "should not save a proposal without a user_id" do
    proposal = Proposal.new(title: "EspressoScript")
    assert !proposal.save, "Saved the proposal without a user"
  end
end
