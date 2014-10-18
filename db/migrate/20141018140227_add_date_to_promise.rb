class AddDateToPromise < ActiveRecord::Migration
  def change
    add_column :promises, :date, :date
  end
end
