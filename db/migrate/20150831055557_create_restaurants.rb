class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :phone
      t.float :rank
      t.text :introduction

      t.timestamps null: false
    end
  end
end
