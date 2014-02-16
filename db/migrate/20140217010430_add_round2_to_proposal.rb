class AddRound2ToProposal < ActiveRecord::Migration
  def change
    add_column :proposals, :round2, :boolean, default: false
  end
end
