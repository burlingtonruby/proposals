class ProposalsController < ApplicationController
  def index
    @proposals = Proposal.all
  end

  def create
    @proposal = Proposal.new(proposal_params)

    if @proposal.save
      flash[:success] = "Proposal successfully created. You will hear from us when the CFP closes. Thanks!"
      redirect_to @proposal
    else
      render 'new'
    end
  end

  private

  def proposal_params
    params.require(:proposal).permit(:title, :abstract, :notes, :pitch, :user_id)
  end
end
