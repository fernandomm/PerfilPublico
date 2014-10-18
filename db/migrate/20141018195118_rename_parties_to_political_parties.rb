class RenamePartiesToPoliticalParties < ActiveRecord::Migration
  def change
    rename_table :parties, :political_parties
  end
end
