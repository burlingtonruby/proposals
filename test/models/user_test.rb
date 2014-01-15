require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @brett = users(:brett)
  end

  test "should have many proposals" do
    assert_equal @brett.proposals.count, 2
  end
end
