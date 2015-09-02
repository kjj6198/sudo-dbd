class ChangeRestaurantPictureColumnType < ActiveRecord::Migration
  def change
  	add_column :restaurants, :url, :string
  	
  end
end
