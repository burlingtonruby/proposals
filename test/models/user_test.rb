require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @brett = users(:brett)
  end

  test "should have many proposals" do
    assert_equal @brett.proposals.count, 2
  end

  test "should create a user with omniauth" do
    assert_difference('User.count') do
      User.create_with_omniauth({ 'provider' => 'github', 'uid' => '12345', 'info' => { 'name' => 'Sebastian' }})
    end
  end
end
