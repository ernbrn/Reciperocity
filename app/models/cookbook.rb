class Cookbook < ActiveRecord::Base
  has_many :cookbook_entries
  has_many :recipes, through: :cookbook_entries
  belongs_to :user
end
