class AddOwnerToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :owner, :integer
  end
end
