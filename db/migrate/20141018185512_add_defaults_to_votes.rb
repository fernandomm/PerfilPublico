class AddDefaultsToVotes < ActiveRecord::Migration
  def change
    change_column :promises, :up_votes, :integer, default: 0
    change_column :promises, :down_votes, :integer, default: 0
  end
end
