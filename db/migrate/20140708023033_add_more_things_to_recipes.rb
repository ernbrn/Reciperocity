class AddMoreThingsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :yield, :string
    add_column :recipes, :ingredient_list, :text
    add_column :recipes, :prep_time, :string
    add_column :recipes, :cook_time, :string
  end
end
