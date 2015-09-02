class Restaurant < ActiveRecord::Base
  
  has_many :menus
  
  validates :name, :phone, :url, presence: true
end
