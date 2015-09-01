class RemoveOwnerToOrders < ActiveRecord::Migration
  def change
  	remove_column :orders, :owner
  	add_reference :menus, :users, index: true
  end
end
