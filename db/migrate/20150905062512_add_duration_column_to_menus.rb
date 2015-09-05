class AddDurationColumnToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :duration, :integer
  end
end
