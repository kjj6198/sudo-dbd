class ChangeColumnToOrders < ActiveRecord::Migration
  def change
  	change_column :orders, :has_paid, :boolean, :default => false
  end
end
