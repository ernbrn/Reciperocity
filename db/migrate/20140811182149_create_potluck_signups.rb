class CreatePotluckSignups < ActiveRecord::Migration
  def change
    create_table :potluck_signups do |t|

      t.timestamps
    end
  end
end
