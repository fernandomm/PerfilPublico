class AddPartyIdToCandidates < ActiveRecord::Migration
  def change
    add_reference :candidates, :party, index: true
  end
end
