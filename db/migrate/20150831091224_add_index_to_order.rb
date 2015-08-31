class AddIndexToOrder < ActiveRecord::Migration
  def change
  	add_reference :orders, :menu, index:true
  end
end
