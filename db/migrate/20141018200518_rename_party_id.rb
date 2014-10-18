class RenamePartyId < ActiveRecord::Migration
  def change
    rename_column :candidates, :party_id, :political_party_id
  end
end
