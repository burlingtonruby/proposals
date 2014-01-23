class ProposalMailer < ActionMailer::Base
  default from: 'Burlington Ruby Conference <info@burlingtonrubyconference.com>'

  def confirmation(proposal_id)
    @proposal = Proposal.find(proposal_id)

    mail(
      to: "#{@proposal.user_name} <#{@proposal.user_email}>",
      subject: 'Thanks for submitting a proposal to the Burlington Ruby Conference!'
    )
  end
end
