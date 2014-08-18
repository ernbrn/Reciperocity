class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :recipes
  has_many :authentications
  has_many :potluck_signups
  has_many :potlucks, through: :potluck_signups
  has_many :cookbooks



  def apply_omniauth(omniauth)
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid']) if omniauth
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end



end
