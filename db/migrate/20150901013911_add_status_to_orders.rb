class AddStatusToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :status, :boolean , :default => true
  end
end
