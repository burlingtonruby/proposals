class CreateHiddenVotes < ActiveRecord::Migration
  def change
    create_table :hidden_votes do |t|
      t.references :user, index: true
      t.references :proposal, index: true
      t.string :round, index: true

      t.timestamps
    end
  end
end
