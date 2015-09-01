class AddStatusToMenus < ActiveRecord::Migration
  def change
  	add_column :menus, :status, :boolean , :default => true
  end
end
