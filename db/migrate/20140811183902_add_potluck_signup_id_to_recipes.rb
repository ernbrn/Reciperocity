class AddPotluckSignupIdToRecipes < ActiveRecord::Migration
  def change
    add_column :potluck_signups, :recipe_id, :integer
  end
end
