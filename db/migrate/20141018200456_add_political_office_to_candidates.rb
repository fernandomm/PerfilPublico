class AddPoliticalOfficeToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :political_office, :string
  end
end
