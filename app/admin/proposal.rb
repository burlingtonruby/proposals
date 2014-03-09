ActiveAdmin.register Proposal do
  permit_params :title, :abstract, :notes, :pitch

  form do |f|
    f.inputs :title, :abstract, :notes, :pitch
    f.actions
  end

  batch_action :round2 do |selection|
    Proposal.where(id: selection).update_all(round2: true)
    redirect_to admin_proposals_url
  end
end
