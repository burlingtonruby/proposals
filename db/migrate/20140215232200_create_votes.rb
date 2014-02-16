class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, index: true
      t.references :proposal, index: true
      t.string :round, index: true

      t.timestamps
    end
  end
end
