class ProposalsController < ApplicationController
  before_filter :require_authentication!

  def index
    @proposals = current_user.proposals
  end

  def create
    @proposal = current_user.proposals.build(proposal_params)

    if @proposal.save
      redirect_to @proposal
      flash[:success] = "Proposal successfully created. You will hear from us when the CFP closes. Thanks!"
    else
      render 'new'
    end
  end

  def new
    @proposal = Proposal.new
  end

  def show
    @proposal = Proposal.find(params[:id])
    require_permission!(@proposal.user)
  end

  def edit
    @proposal = Proposal.find(params[:id])
  end

  def update
    @proposal = Proposal.find(params[:id])

    if @proposal.update_attributes(proposal_params)
      redirect_to @proposal
      flash[:success] = "Proposal successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @proposal = Proposal.find(params[:id])

    unless require_permission!(@proposal.user)
      @proposal.destroy
      redirect_to proposals_path
      flash[:notice] = 'Proposal destroyed.'
    end
  end

  private

  def proposal_params
    params.require(:proposal).permit(:title, :abstract, :notes, :pitch, :user_id)
  end
end
