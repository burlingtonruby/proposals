class ProposalsController < ApplicationController
  include UserHelper

  def index
    if current_user
      @proposals = current_user.proposals
    else
      redirect_to root_path
      flash[:alert] = "Sorry, but you can't see that."
    end
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
    if current_user
      @proposal = Proposal.new
    else
      redirect_to root_path
      flash[:alert] = "You must sign in to create a proposal."
    end
  end

  def show
    @proposal = Proposal.find(params[:id])
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
    Proposal.find(params[:id]).destroy
    redirect_to proposals_path
    flash[:notice] = 'Proposal destroyed.'
  end

  private

  def proposal_params
    params.require(:proposal).permit(:title, :abstract, :notes, :pitch, :user_id)
  end
end
