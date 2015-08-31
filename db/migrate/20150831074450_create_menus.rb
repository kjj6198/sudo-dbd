class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.time :start_time
      t.time :end_time

      t.timestamps null: false
    end
  end
end
