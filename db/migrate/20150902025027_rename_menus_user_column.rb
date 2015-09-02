class RenameMenusUserColumn < ActiveRecord::Migration
  def change
  	rename_column :menus, :users_id, :user_id
  end
end
