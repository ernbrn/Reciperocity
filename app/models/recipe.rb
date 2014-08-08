class Recipe < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  acts_as_taggable

  belongs_to :user
  has_many :ingredients
  has_and_belongs_to_many :potlucks
  accepts_nested_attributes_for :ingredients, :reject_if => :all_blank, :allow_destroy => true

  searchable do
   text :dish_name
    text :ingredients do
      ingredients.map {|ingredient| ingredient.name}
    end
  end

  def split_instructions
    self.instructions = instructions.split("\n")
  end

end
