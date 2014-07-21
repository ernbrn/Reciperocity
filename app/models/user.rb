class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :recipes
  has_many :authentications



  def apply_omniauth(omniauth)
    authentications.build(:provider => auth_hash['provider'], :uid => auth_hash['uid'], :oauth_token => auth_hash['oauth_token'])
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end



end
