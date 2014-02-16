class AddsVoterToUser < ActiveRecord::Migration
  def change
    add_column :users, :voter, :boolean, default: false
  end
end
