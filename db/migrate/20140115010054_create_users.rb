class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :email
      t.text :bio
      t.string :website
      t.string :twitter
      t.string :github

      t.timestamps
    end
  end
end
