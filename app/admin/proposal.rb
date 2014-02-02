ActiveAdmin.register Proposal do
  permit_params :title, :abstract, :notes, :pitch

  form do |f|
    f.inputs :title, :abstract, :notes, :pitch
    f.actions
  end
end
