class AddInviteesToPotlucks < ActiveRecord::Migration
  def change
    add_column :potlucks, :invitees, :text, array: true
  end
end
