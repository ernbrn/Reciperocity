class AddIdsToCookbookEntries < ActiveRecord::Migration
  def change
    add_column :cookbook_entries, :recipe_id, :integer
    add_column :cookbook_entries, :cookbook_id, :integer
  end
end
