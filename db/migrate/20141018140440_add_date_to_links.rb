class AddDateToLinks < ActiveRecord::Migration
  def change
    add_column :links, :date, :date
  end
end
