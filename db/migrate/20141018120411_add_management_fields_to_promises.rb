class AddManagementFieldsToPromises < ActiveRecord::Migration
  def change
    add_column :promises, :visible, :boolean
    add_column :promises, :status, :string
  end
end
