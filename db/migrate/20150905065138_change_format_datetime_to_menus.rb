class ChangeFormatDatetimeToMenus < ActiveRecord::Migration
  def change
    remove_column :menus, :start_time
    remove_column :menus, :end_time
  	add_column :menus, :start_time, :datetime
    add_column :menus, :end_time, :datetime
  end
end
