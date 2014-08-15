class CreateCookbookEntries < ActiveRecord::Migration
  def change
    create_table :cookbook_entries do |t|

      t.timestamps
    end
  end
end
