class AddVisualizationCountToPromises < ActiveRecord::Migration
  def change
    add_column :promises, :visualization_count, :integer, default: 0
  end
end
