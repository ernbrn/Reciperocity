class Ingredient < ActiveRecord::Base
  belongs_to :recipe

  searchable do
    text :name
  end
end
