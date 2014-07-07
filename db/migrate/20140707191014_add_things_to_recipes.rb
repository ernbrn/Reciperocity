class AddThingsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :dish_name, :string
    add_column :recipes, :instructions, :text
  end
end
