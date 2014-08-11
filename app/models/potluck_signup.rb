class PotluckSignup < ActiveRecord::Base
  has_many :users
  has_many :recipes
  belongs_to :potluck
end
