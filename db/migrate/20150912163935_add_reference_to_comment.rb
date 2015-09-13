class AddReferenceToComment < ActiveRecord::Migration
  def change
  	add_reference :comments, :restaurant, index: true
  	add_reference :comments, :user, index: true
  end
end
