class AddUserIdToPotluckSignups < ActiveRecord::Migration
  def change
    add_column :potluck_signups, :user_id, :integer
  end
end
