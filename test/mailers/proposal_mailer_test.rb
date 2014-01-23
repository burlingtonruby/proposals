require 'test_helper'

class ProposalMailerTest < ActionMailer::TestCase
  test "confirmation" do
    proposal = proposals(:rails_doesnt_scale)
    mail = ProposalMailer.confirmation(proposal.id)
    assert_equal "Thanks for submitting a proposal to Burlington Ruby!", mail.subject
    assert_equal ["brett@tacobell.com"], mail.to
    assert_equal ["info@burlingtonrubyconference.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
