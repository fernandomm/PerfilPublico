class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.integer :age
      t.text :biography

      t.timestamps
    end
  end
end
