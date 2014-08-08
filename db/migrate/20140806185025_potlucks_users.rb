class PotlucksUsers < ActiveRecord::Migration
  def change
    create_table :potlucks_users, id: false do |t|
      t.belongs_to :potluck
      t.belongs_to :user
    end
  end
end
