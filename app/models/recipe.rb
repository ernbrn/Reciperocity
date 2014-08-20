class Recipe < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  acts_as_taggable

  belongs_to :user
  has_many :ingredients
  has_many :cookbook_entries
  has_many :cookbooks, through: :cookbook_entries
  has_many :potluck_signups
  has_many :potlucks, through: :potluck_signups
  accepts_nested_attributes_for :ingredients, :reject_if => :all_blank, :allow_destroy => true


  def split_instructions
    instructions = self.instructions
    instructions = instructions.split("\n")
    instructions
  end

  def self.text_search(query)
    if query.present?
      where("dish_name @@ :q", q: query)
    else
      Recipe.all
    end
  end

  def clean
   self.remove_picture!
   self.save
   self
  end

end
