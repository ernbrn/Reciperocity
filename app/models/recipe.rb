class Recipe < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  acts_as_taggable

  belongs_to :user
end
