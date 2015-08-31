class Restaurant < ActiveRecord::Base
  mount_uploader :restaurant_picture, RestaurantPictureUploader
  
  def get_restaurant
	return Restaurant.all
  end
end
