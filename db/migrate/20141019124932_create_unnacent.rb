class CreateUnnacent < ActiveRecord::Migration
  def change
    execute "CREATE EXTENSION unaccent;"
  end
end
