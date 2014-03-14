class ProposalsController < ApplicationController
  before_filter :require_authentication!
  before_filter :require_before_close_date!, only: [:create, :new, :edit, :update]

  def index
    @proposals = current_user.proposals
  end

  def create
    @proposal = current_user.proposals.new
    @proposal.attributes = proposal_params

    if @proposal.save_and_send_confirmation
      redirect_to @proposal
      flash[:success] = "Proposal successfully created. You will receive an email confirmation shortly. Thanks!"
    else
      render 'new'
    end
  end

  def new
    @proposal = current_user.proposals.new
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
    params.require(:proposal).permit(:title, :abstract, :notes, :pitch,
      user_attributes: [:name, :email, :photo, :website, :bio, :twitter, :github])
  end

  def require_before_close_date!
    if past_cutoff_date?
      redirect_to root_path, alert: "Proposals are closed, sorry."
    end
  end
end
