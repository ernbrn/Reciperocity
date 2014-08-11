class AddPotluckIdToPotluckSignups < ActiveRecord::Migration
  def change
    add_column :potluck_signups, :potluck_id, :integer
  end
end
