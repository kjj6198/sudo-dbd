class AddNameOfAttrForFilepickerUrlToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :filepicker_url, :string
  end
end
