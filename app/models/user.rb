class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:google_oauth2]
  validates :email, format: {
  	with: /\A([A-Za-z0-9_\-\.])+\@sudo.com.tw\z/
  }
  has_many :menus
  has_many :orders
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first
    unless user
      user = User.create(username: data["name"],
            email: data["email"],
            password: Devise.friendly_token[0,20])
    end
    user
  end  
end
