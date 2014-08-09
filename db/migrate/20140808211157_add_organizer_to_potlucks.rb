class AddOrganizerToPotlucks < ActiveRecord::Migration
  def change
    add_column :potlucks, :organizer, :string
  end
end
