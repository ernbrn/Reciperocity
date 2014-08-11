class RemovePotluckJoinTables < ActiveRecord::Migration
  def change
    drop_table :potlucks_recipes
    drop_table :potlucks_users
  end
end
