class RenameMenuRestaurantColumn < ActiveRecord::Migration
  def change
  	rename_column :menus, :restaurants_id, :restaurant_id
  end
end
