class Menu < ActiveRecord::Base
  has_many :orders ,dependent: :destroy

  belongs_to :owner, class_name: 'User', foreign_key: :users_id
  belongs_to :restaurant
end
