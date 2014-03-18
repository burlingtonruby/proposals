ActiveAdmin.register User do
  permit_params :name, :email, :bio, :website, :twitter, :github, :voter, :photo

  index do
    column :name
    column :email
    column :website
    column :twitter
    default_actions
  end

  form html: {enctype: "multipart/form-data" } do |f|
    f.inputs :name, :email, :bio, :website, :twitter, :github, :voter, :photo
    f.actions
  end
end
