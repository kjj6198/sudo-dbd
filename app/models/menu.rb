class Menu < ActiveRecord::Base
  has_many :orders ,dependent: :destroy

  belongs_to :user
  belongs_to :restaurant
end
