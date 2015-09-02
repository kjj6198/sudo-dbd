class Restaurant < ActiveRecord::Base
  mount_uploader :restaurant_picture, RestaurantPictureUploader
  has_many :menus
  
  validates :name, :phone, :restaurant_picture, presence: true
end
