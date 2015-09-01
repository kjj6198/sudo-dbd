class AddReferenceToMenus < ActiveRecord::Migration
  def change
    add_reference :menus, :restaurants, index: true
  end
end
