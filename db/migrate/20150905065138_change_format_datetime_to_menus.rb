class ChangeFormatDatetimeToMenus < ActiveRecord::Migration
  def change
  	change_column :menus, :start_time, :datetime
  	change_column :menus, :end_time, :datetime
  end
end
