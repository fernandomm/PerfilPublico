class CreatePromises < ActiveRecord::Migration
  def change
    create_table :promises do |t|
      t.references :candidate, index: true
      t.references :category, index: true
      t.string :title
      t.text :description
      t.integer :up_votes
      t.integer :down_votes

      t.timestamps
    end
  end
end
