class AddPictureToRestaurants1 < ActiveRecord::Migration
  def change
  	add_column :restaurants, :restaurant_picture, :file
  end
end
