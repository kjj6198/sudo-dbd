class Restaurant < ActiveRecord::Base
  mount_uploader :restaurant_picture, RestaurantPictureUploader
  has_many :menus
  
  def get_restaurant
	return Restaurant.all
  end
end
