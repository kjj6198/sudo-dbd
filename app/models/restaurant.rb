class Restaurant < ActiveRecord::Base
  
  has_many :menus
  
  validates :name, :phone, presence: true
end
