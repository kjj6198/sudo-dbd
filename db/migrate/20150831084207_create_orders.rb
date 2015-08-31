class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :food_name
      t.integer :price
      t.boolean :has_paid
      t.string :owner

      t.timestamps null: false
    end
  end
end
