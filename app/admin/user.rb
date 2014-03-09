ActiveAdmin.register User do
  permit_params :name, :email, :bio, :website, :twitter, :github

  index do
    column :name
    column :email
    column :website
    column :twitter
    default_actions
  end

  form do |f|
    f.inputs :name, :email, :bio, :website, :twitter, :github, :voter
    f.actions
  end
end
