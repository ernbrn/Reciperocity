class Potluck < ActiveRecord::Base
  has_many :potluck_signups
  has_many :users, through: :potluck_signups
  has_many :recipes, through: :potluck_signups

end
