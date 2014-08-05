class Recipe < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  acts_as_taggable

  belongs_to :user
  has_many :ingredients
  accepts_nested_attributes_for :ingredients, :reject_if => :all_blank, :allow_destroy => true

  searchable do
    text :dish_name
  end

end
