class AddPictureToRestaurants1 < ActiveRecord::Migration
  def change
  	add_column :restaurants, :url, :string
  end
end
