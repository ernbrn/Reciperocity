class RemoveIngredientsFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :ingredient_list
  end
end
