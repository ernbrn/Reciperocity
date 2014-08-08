class AddRecipesAndPotlucks < ActiveRecord::Migration
  def change
    create_table :potlucks_recipes, id: false do |t|
      t.belongs_to :potluck
      t.belongs_to :recipe
    end
  end
end
