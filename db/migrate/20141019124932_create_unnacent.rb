class CreateUnnacent < ActiveRecord::Migration
  def change
    create_table :unnacents do |t|
      execute "CREATE EXTENSION unaccent;"
    end
  end
end
