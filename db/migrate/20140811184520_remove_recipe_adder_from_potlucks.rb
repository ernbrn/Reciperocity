class RemoveRecipeAdderFromPotlucks < ActiveRecord::Migration
  def change
    remove_column :potlucks, :recipe_adder, :integer
  end
end
