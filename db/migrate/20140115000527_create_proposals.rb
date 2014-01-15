class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :title
      t.text :abstract
      t.text :notes
      t.text :pitch
      t.references :user, index: true

      t.timestamps
    end
  end
end
